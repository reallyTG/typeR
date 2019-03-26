library(Epi)


### Name: bootLexis
### Title: Create a bootstrap sample of persons ('lex.id') from a Lexis
###   object
### Aliases: nid nid.Lexis bootLexis
### Keywords: manip

### ** Examples

# A small bogus cohort
xcoh <- data.frame( id = c("A", "B", "C"),
                 birth = c("14/07/1952", "01/04/1954", "10/06/1987"),
                 entry = c("04/08/1965", "08/09/1972", "23/12/1991"),
                  exit = c("27/06/1997", "23/05/1995", "24/07/1998"),
                  fail = c(1, 0, 1),
                   sex = c("M","F","M") )
xcoh <- data.frame( id = c("A", "B", "C"),
                 birth = as.Date(c("14/07/1952","01/04/1954","10/06/1987"),format="%d/%m/%Y"),
                 entry = as.Date(c("04/08/1965","08/09/1972","23/12/1991"),format="%d/%m/%Y"),
                  exit = as.Date(c("27/06/1997","23/05/1995","24/07/1998"),format="%d/%m/%Y"),
                  fail = c(1, 0, 1),
                   sex = c("M","F","M") )
xcoh <- cal.yr( xcoh )
Lcoh <- Lexis( entry = list( per=entry ),
                exit = list( per=exit, age=exit-birth ),
         exit.status = fail,
                data = xcoh )
Lx <- Lcoh[sample(1:3,10,replace=TRUE),]
Lx$per <- Lx$per + runif(10,0,10)
Lx$lex.id <- 1:10
Lx <- splitLexis( Lx, breaks=0:10*10, "age" )
Lx
nid( Lx )
nid( Lx, by="sex" )
bootLexis( Lx )
nid( bootLexis( Lx, size=7 ) )
Li <- bootLexis( Lx, by="id" ) # superfluous
L2 <- bootLexis( Lx, by="sex", size=c(2,5) )
nid( L2, by="sex" )



