library(Epi)


### Name: Lexis.diagram
### Title: Plot a Lexis diagram
### Aliases: Lexis.diagram
### Keywords: hplot dplot

### ** Examples

Lexis.diagram( entry.age = c(3,30,45),
               risk.time = c(25,5,14),
              birth.date = c(1970,1931,1925.7),
                    fail = c(TRUE,TRUE,FALSE) )
LL <- Lexis.diagram( entry.age = sample( 0:50, 17, replace=TRUE ),
                     risk.time = sample( 5:40, 17, r=TRUE),
                    birth.date = sample( 1910:1980, 17, r=TRUE ),
          		  fail = sample( 0:1, 17, r=TRUE ), 
	              cex.fail = 1.1,
	              lwd.life = 2 )
# Identify the persons' entry and exits
text( LL$exit.date, LL$exit.age, paste(1:nrow(LL)), col="red", font=2, adj=c(0,1) )
text( LL$entry.date, LL$entry.age, paste(1:nrow(LL)), col="blue", font=2, adj=c(1,0) )
data( nickel )
attach( nickel )
LL <- Lexis.diagram( age=c(10,100), date=c(1900,1990), 
	             entry.age=age1st, exit.age=ageout, birth.date=dob, 
		     fail=(icd %in% c(162,163)), lwd.life=1,
		     cex.fail=0.8, col.fail=c("green","red") )
abline( v=1934, col="blue" )
nickel[1:10,]
LL[1:10,]



