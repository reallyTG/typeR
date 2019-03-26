library(metasens)


### Name: copas
### Title: Copas selection model analysis
### Aliases: copas
### Keywords: htest

### ** Examples

##
## Basic example
##
## Load data
##
data(Fleiss93)
##
## Perform meta-analysis
##  (Note event.e indicates events, n.e total in exposed arm;
##        event.c indicates events, n.c total in control arm)
##
meta1 <- metabin(event.e, n.e, event.c, n.c, data=Fleiss93, sm="OR")
summary(meta1)
##
## To perform a basic Copas-selection model analysis
##
cop1 <- copas(meta1)
plot(cop1)
summary(cop1)
##
## Interpretation: 
##
## a. The initial meta-analysis shows the fixed and random effects pooled
##    ORs differ; consistent with asymmetry in the funnel plot and
##    possible selection bias. Both fixed effect and random effects model
##    show a significant treatment effect in this dataset.
##
## b. Plotting the copas analysis shows
##
## (i) funnel plot: asymmetry indicates possible selection bias.
##
## (ii) contour plot treatment effect declines steadily as selection
##      increases (no selection, top right, log OR < -0.12; increasing
##      selection as move to left of plot, log OR rises to -0.03.
##

## (iii) Treatment effect plot suggests that even with no selection,
##       p-value for treatment effect is larger than 0.05 which is
##       different from the result of the usual random effects model
##       (see output of summary(cop1). This difference is due to the
##       use of different methods to estimate the between-study
##       variance: maximum-likelihood in Copas analysis compared to
##       method-of-moments in usual random effects model.
##       The p-value for treatment effect is increasing with
##       increasing selection.
##
## (iv) P-value for residual selection bias plot: this shows that even
##      with no selection bias, the p-value for residual selection bias
##      is non-significant at the 10% level. As expected, as selection
##      increases the p-value for residual selection bias increases too.


## Repeat the same example, setting all the arguments of the copas
## function:
##
cop2 <- copas(meta1,
            gamma0.range=c(-0.5,2.1), # range of gamma0 parameter
            gamma1.range=c(0, 0.08),  # range of gamma1 parameter
            ngrid=20,                 # specify a 20X20 grid (finer than default)
            levels=c(-0.13, -0.12, -0.1, -0.09, -0.07, -0.05, -0.03),# specify contour lines
            slope=0.2,       # specify slope of 'orthogonal' line in contour plot
            left=FALSE,      # as any selection bias due to missing studies on right
            rho.bound=0.998, # constrain rho between [-0.998, 0.998]
            silent=FALSE,    # update user on progress
            warn=-1          # suppress warning messages
           )
plot(cop2)
##
## Print table of results used to draw treatment effect plot:
##
summary(cop2)                    



