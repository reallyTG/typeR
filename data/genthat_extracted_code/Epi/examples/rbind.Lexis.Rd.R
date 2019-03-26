library(Epi)


### Name: cbind.Lexis
### Title: Combining a Lexis objects with data frames or other Lexis
###   objects
### Aliases: cbind.Lexis rbind.Lexis
### Keywords: survival,manip

### ** Examples

# A small bogus cohort
xcoh <- structure( list( id = c("A", "B", "C"),
                      birth = c("14/07/1952", "01/04/1954", "10/06/1987"),
                      entry = c("04/08/1965", "08/09/1972", "23/12/1991"),
                       exit = c("27/06/1997", "23/05/1995", "24/07/1998"),
                       fail = c(1, 0, 1) ),
                     .Names = c("id", "birth", "entry", "exit", "fail"),
                  row.names = c("1", "2", "3"),
                      class = "data.frame" )

# Convert the character dates into numerical variables (fractional years)
xcoh <- cal.yr( xcoh, format="%d/%m/%Y", wh=2:4 )
# See how it looks
xcoh
str( xcoh )

# Define as Lexis object with timescales calendar time and age
Lcoh <- Lexis( entry = list( per=entry ),
                exit = list( per=exit, age=exit-birth ),
         exit.status = fail,
                data = xcoh )
Lcoh
cbind( Lcoh, zz=3:5 )

# Lexis object wit time since entry time scale
Dcoh <- Lexis( entry = list( per=entry, tfe=0 ),
                exit = list( per=exit ),
         exit.status = fail,
                data = xcoh )
# A bit meningless to combie these two, really...
rbind( Dcoh, Lcoh )

# Split different places
sL <- splitLexis( Lcoh, time.scale="age", breaks=0:20*5 )
sD <- splitLexis( Dcoh, time.scale="tfe", breaks=0:50*2 )
sDL <- rbind( sD, sL )



