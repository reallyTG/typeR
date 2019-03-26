library(sampleSelection)


### Name: Mroz87
### Title: U.S. Women's Labor Force Participation
### Aliases: Mroz87
### Keywords: datasets

### ** Examples

## Wooldridge( 2003 ): example 17.5, page 590
data( Mroz87 )
# Two-step estimation
summary( heckit( lfp ~ nwifeinc + educ + exper + I( exper^2 ) + age +
   kids5 + kids618, log( wage ) ~ educ + exper + I( exper^2 ), Mroz87,
   method = "2step" ) )



