library(gmDatabase)


### Name: gmSQL
### Title: Provide an R representation of SQL
### Aliases: gmSQLTable gmSQL gmSQL2SQL SQLenv SQL2SQLenv
### Keywords: databases

### ** Examples

tabA <- gmSQLTable("A")
tabB <- gmSQLTable("B")
ennv <- new.env(parent=SQLenv)
assign("tabA", tabA, ennv)
assign("tabB", tabB, ennv)
AB <- gmSQL(join(tabA,tabB,on=tabA$id==tabB$refID), env=ennv)
AB
gmSQL2SQL(tabA)
gmSQL2SQL(tabB)
gmSQL2SQL(AB)
legalvalues <- 1:3
assign("AB", AB, ennv)
assign("legalvalues", legalvalues, ennv)
sAB <- gmSQL(select(what=list(x=1,y=tabA$y*tabB$y),
                    from=AB,
                    where=Call("log",tabB$othervalue)<=17 &&
                          IN(tabA$inte,c(legalvalues)),
                    as=NULL), env=ennv)

cat(gmSQL2SQL(sAB))




