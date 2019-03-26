library(lsr)


### Name: etaSquared
### Title: Effect size calculations for ANOVAs
### Aliases: etaSquared

### ** Examples

#### Example 1: one-way ANOVA ####

outcome <- c( 1.4,2.1,3.0,2.1,3.2,4.7,3.5,4.5,5.4 )  # data
treatment1 <- factor( c( 1,1,1,2,2,2,3,3,3 ))        # grouping variable
anova1 <- aov( outcome ~ treatment1 )                # run the ANOVA
summary( anova1 )                                    # print the ANOVA table
etaSquared( anova1 )                                 # effect size                            

#### Example 2: two-way ANOVA ####

treatment2 <- factor( c( 1,2,3,1,2,3,1,2,3 ))      # second grouping variable
anova2 <- aov( outcome ~ treatment1 + treatment2 ) # run the ANOVA
summary( anova2 )                                  # print the ANOVA table
etaSquared( anova2 )                               # effect size





