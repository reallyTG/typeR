library(memisc)


### Name: annotations
### Title: Adding Annotations to Objects
### Aliases: annotation annotation,ANY-method annotation,item-method
###   annotation,data.set-method annotation<-
###   annotation<-,ANY,character-method annotation<-,item,annotation-method
###   annotation<-,vector,annotation-method description
###   description,data.set-method description,importer-method description<-
###   wording wording<- annotation-class show,annotation-method

### ** Examples

vote <- sample(c(1,2,3,8,9,97,99),size=30,replace=TRUE)
labels(vote) <- c(Conservatives         =  1,
                    Labour                =  2,
                    "Liberal Democrats"   =  3,
                    "Don't know"          =  8,
                    "Answer refused"      =  9,
                    "Not applicable"      = 97,
                    "Not asked in survey" = 99
                    )
missing.values(vote) <- c(97,99)
description(vote) <- "Vote intention"
wording(vote) <- "If a general election would take place next tuesday,
                    the candidate of which party would you vote for?"
annotation(vote)
annotation(vote)["Remark"] <- "This is not a real questionnaire item, of course ..."
codebook(vote)



