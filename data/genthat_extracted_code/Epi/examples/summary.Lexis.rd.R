library(Epi)


### Name: summary.Lexis
### Title: Summarize transitions and risk time from a Lexis object
### Aliases: summary.Lexis print.summary.Lexis
### Keywords: survival

### ** Examples

data( nickel )
# Lung cancer deaths and other deaths are coded 1 and 2
nic <- Lexis( data=nickel,
             entry=list(age=agein),
              exit=list(age=ageout,cal=ageout+dob,tfh=ageout-age1st),
       exit.status=factor( (icd > 0) + (icd %in% c(162,163)),
                           labels=c("Alive","Other","Lung") ) )
str( nic )
head( nic )
summary( nic )
# More detailed summary, by exposure level
summary( nic, by=nic$exposure>5, Rates=TRUE, scale=100 )



