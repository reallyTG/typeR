library(EdSurvey)


### Name: recode.sdf
### Title: Recode Levels Within Variables
### Aliases: recode.sdf

### ** Examples

## Not run: 
##D # filepath argument will vary by operating system conventions
##D usaG4.15 <- readTIMSS("C:/TIMSS2015", "usa", 4)
##D d <- getData(usaG4.15, "itsex")
##D summary(d) #show details: MALE/FEMALE
##D usaG4.15 <- recode.sdf(usaG4.15,
##D                        recode = list(itsex=list(from=c("MALE"),
##D                                                 to=c("BOY")),
##D                                      itsex=list(from=c("FEMALE"),
##D                                                 to=c("GIRL"))))
##D 
##D d <- getData(usaG4.15, "itsex") #apply recode
##D summary(d) #show details: BOY/GIRL
## End(Not run)



