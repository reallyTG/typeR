library(Epi)


### Name: timeBand
### Title: Extract time band data from a split Lexis object
### Aliases: timeBand breaks
### Keywords: attribute

### ** Examples

data(diet)
diet <- cal.yr(diet)
diet.lex <- Lexis(entry=list(period=doe),
                   exit=list(period=dox, age=dox-dob),
            exit.status=chd,
                   data=diet)
diet.split <- splitLexis(diet.lex, breaks=seq(40,70,5), "age" )
age.left <- timeBand(diet.split, "age", "left")
table(age.left)
age.fact <- timeBand(diet.split, "age", "factor")
table(age.fact)
age.mid <- timeBand(diet.split, "age", "mid")
table(age.mid)



