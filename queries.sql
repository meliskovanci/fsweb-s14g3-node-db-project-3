-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
Select p.ProductName, c.CategoryName FROM Product p join Category c on p.CategoryId=c.Id

-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
Select o.Id , sh.CompanyName From [Order] o join Shipper sh on o.ShipVia = sh.Id 
where OrderDate < '2012-08-09';

-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
Select p.ProductName, q.Quantity From Product p join OrderDetail q on q.ProductId = p.Id Where q.OrderId=10251 Group By p.ProductName

-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)
Select o.Id, cus.CompanyName, em.LastName From [Order] o 
join Customer cus on o.CustomerId = cus.Id 
join Employee em on o.EmployeeId = em.Id