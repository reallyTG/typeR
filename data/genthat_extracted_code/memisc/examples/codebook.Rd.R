library(memisc)


### Name: codebook
### Title: Generate a Codebook of a Data Set
### Aliases: codebook codebook,item-method codebook,data.set-method
###   codebook,importer-method codebook,atomic-method
###   codebook,data.frame-method codebook,factor-method codebook-class
###   format,codebookEntry-method show,codebook-method
###   as.character,codebook-method
### Keywords: manip

### ** Examples


Data <- data.set(
          vote = sample(c(1,2,3,8,9,97,99),size=300,replace=TRUE),
          region = sample(c(rep(1,3),rep(2,2),3,99),size=300,replace=TRUE),
          income = exp(rnorm(300,sd=.7))*2000
          )

Data <- within(Data,{
  description(vote) <- "Vote intention"
  description(region) <- "Region of residence"
  description(income) <- "Household income"
  wording(vote) <- "If a general election would take place next tuesday,
                    the candidate of which party would you vote for?"
  wording(income) <- "All things taken into account, how much do all
                    household members earn in sum?"
  foreach(x=c(vote,region),{
    measurement(x) <- "nominal"
    })
  measurement(income) <- "ratio"
  labels(vote) <- c(
                    Conservatives         =  1,
                    Labour                =  2,
                    "Liberal Democrats"   =  3,
                    "Don't know"          =  8,
                    "Answer refused"      =  9,
                    "Not applicable"      = 97,
                    "Not asked in survey" = 99)
  labels(region) <- c(
                    England               =  1,
                    Scotland              =  2,
                    Wales                 =  3,
                    "Not applicable"      = 97,
                    "Not asked in survey" = 99)
  foreach(x=c(vote,region,income),{
    annotation(x)["Remark"] <- "This is not a real survey item, of course ..."
    })
  missing.values(vote) <- c(8,9,97,99)
  missing.values(region) <- c(97,99)
})

description(Data)

codebook(Data)

## Not run: 
##D Write(descrition(Data),
##D            file="Data-desc.txt")
##D Write(codebook(Data),
##D            file="Data-cdbk.txt")
##D   
## End(Not run)



