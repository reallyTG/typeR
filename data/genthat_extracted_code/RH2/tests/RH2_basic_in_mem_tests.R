library(RH2)

con = dbConnect(H2(), "jdbc:h2:mem:")

x = data.frame(id=1:10,txt=letters[1:10])
dbWriteTable(con,"atab",x)
dbGetQuery(con,"SELECT * FROM atab WHERE id>5")

dbWriteTable(con,"btab",1:5)
dbGetQuery(con,"SELECT * FROM btab")

qr = dbSendQuery(con,"SELECT * FROM atab")
fetch(qr,1)
fetch(qr,4)
fetch(qr,10)
fetch(qr,10)

dbDisconnect(con)
