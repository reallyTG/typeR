library(prettyR)


### Name: xtab
### Title: Crosstabulate variables
### Aliases: xtab
### Keywords: misc

### ** Examples

 test.df<-data.frame(sex=sample(c("MALE","FEMALE"),1000,TRUE),
 suburb=sample(1:4,1000,TRUE),social.type=sample(LETTERS[1:4],1000,TRUE))
 xtab(sex~suburb+social.type,test.df,chisq=TRUE)
 # now add some value labels
 attr(test.df$suburb,"value.labels")<-1:4
 names(attr(test.df$suburb,"value.labels"))<-
  c("Upper","Middle","Working","Slum")
 attr(test.df$social.type,"value.labels")<-LETTERS[1:4]
 names(attr(test.df$social.type,"value.labels"))<-
  c("Gregarious","Mixer","Aloof","Hermit")
 xtab(sex~suburb+social.type,test.df)
 # now have some fun with ridiculously long factor labels
 testxtab<-data.frame(firstbit=sample(c("Ecomaniacs","Redneck rogues"),50,TRUE),
  secondbit=sample(c("Macho bungy jumpers","Wimpy quiche munchers"),50,TRUE))
 # and format the table in HTML and add some tests
 xtab(secondbit~firstbit,testxtab,html=TRUE,chisq=TRUE,phi=TRUE)



