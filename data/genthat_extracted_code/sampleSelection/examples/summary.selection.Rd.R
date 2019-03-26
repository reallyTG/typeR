library(sampleSelection)


### Name: summary.selection
### Title: Summarizing Selection Estimations
### Aliases: summary.selection print.summary.selection
### Keywords: models

### ** Examples

## Wooldridge( 2003 ): example 17.5, page 590
data( Mroz87 )
wooldridge <- selection( lfp ~ nwifeinc + educ + exper + I( exper^2 ) +
   age + kids5 + kids618, log( wage ) ~ educ + exper + I( exper^2 ),
   data = Mroz87, method = "2step" )

# summary of the 1st step probit estimation (Example 17.1, p. 562f)
# and the 2nd step OLS regression (example 17.5, page 590)
summary( wooldridge )

# summary of the outcome equation only
print(summary(wooldridge), part="outcome")



