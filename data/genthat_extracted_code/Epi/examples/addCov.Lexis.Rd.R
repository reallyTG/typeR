library(Epi)


### Name: addCov.Lexis
### Title: Add covariates (typically clinical measurements) taken at known
###   times to a Lexis object.
### Aliases: addCov.Lexis
### Keywords: survival

### ** Examples

# A small bogus cohort
xcoh <- structure( list( id = c("A", "B", "C"),
                      birth = c("1952-07-14", "1954-04-01", "1987-06-10"),
                      entry = c("1965-08-04", "1972-09-08", "1991-12-23"),
                       exit = c("1997-06-27", "1995-05-23", "1998-07-24"),
                       fail = c(1, 0, 1) ),
                     .Names = c("id", "birth", "entry", "exit", "fail"),
                  row.names = c("1", "2", "3"),
                      class = "data.frame" )

# Convert the character dates into numerical variables (fractional years)
xcoh$bt <- cal.yr( xcoh$birth )
xcoh$en <- cal.yr( xcoh$entry )
xcoh$ex <- cal.yr( xcoh$exit  )

# Define as Lexis object with timescales calendar time and age
Lcoh <- Lexis( entry = list( per=en ),
                exit = list( per=ex, age=ex-bt ),
         exit.status = factor( fail, 0:1, c("Alive","Dead") ),
                data = xcoh )
str( Lcoh )
Lx <- Lcoh[,1:7]

# Data frame with clinical examination data, date of examination in per
clin <- data.frame( lex.id = c(1,1,3,2),
                       per = c(1977.3,1971.7,1996.2,1990.6),
                        bp = c(120,140,160,157),
                      chol = c(5,7,8,9),
                      xnam = c("X2","X1","X1","X2") )
Lx
clin 

# Different behavours using exnam and addScales
addCov.Lexis( Lx, clin )
addCov.Lexis( Lx, clin, exnam="xnam" )
addCov.Lexis( Lx, clin, addScales=TRUE )
addCov.Lexis( Lx, clin, addScales=TRUE, exnam="xnam" )

# Works with time split BEFORE
Lb <- addCov.Lexis( splitLexis( Lx,
                                time.scale="age",
                                breaks=seq(0,80,5) ),
                    clin,
                    exnam="clX" )
Lb
# ...or AFTER, but only if addScales is given
La <- splitLexis( addCov.Lexis( Lx,
                              clin,
                             exnam = "xnam" ),
                  breaks=seq(0,80,5),
                  time.scale="age" )
La
La <- splitLexis( addCov.Lexis( Lx,
                              clin,
                             exnam = "xnam",
                         addScales = TRUE ),
                  breaks=seq(0,80,5),
                  time.scale="age" )
La



