library(blockrand)


### Name: plotblockrand
### Title: Create a pdf file of randomization cards
### Aliases: plotblockrand
### Keywords: design datagen

### ** Examples

## stratified by sex, 100 in stratum, 2 treatments
male <- blockrand(n=100, id.prefix='M', block.prefix='M',stratum='Male')
female <- blockrand(n=100, id.prefix='F', block.prefix='F',stratum='Female')

my.study <- rbind(male,female)

## Not run: 
##D plotblockrand(my.study,'mystudy.pdf',
##D    top=list(text=c('My Study','Patient: %ID%','Treatment: %TREAT%'),
##D             col=c('black','black','red'),font=c(1,1,4)),
##D    middle=list(text=c("My Study","Sex: %STRAT%","Patient: %ID%"),
##D                col=c('black','blue','green'),font=c(1,2,3)),
##D    bottom="Call 123-4567 to report patient entry",
##D    cut.marks=TRUE)
##D 
##D ### or
##D 
##D my.blockrand.text <- list(
##D    top=list(text=c('My Study','Patient: %ID%','Treatment: %TREAT%'),
##D             col=c('black','black','red'),font=c(1,1,4)),
##D    middle=list(text=c("My Study","Sex: %STRAT%","Patient: %ID%"),
##D                col=c('black','blue','green'),font=c(1,2,3)),
##D    bottom="Call 123-4567 to report patient entry")
##D 
##D plotblockrand(my.study, 'mystudy.pdf', blockrand.text=my.blockrand.text,
##D      cut.marks=TRUE)
## End(Not run)



