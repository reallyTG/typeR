library(sppmix)


### Name: est_MIPPP_cond_loc
### Title: Fit a MIPPP conditionally on location
### Aliases: est_MIPPP_cond_loc plot.MIPPP_fit summary.MIPPP_fit

### ** Examples

## No test: 
# Create a marked point pattern
x <- runif(100)
y <- runif(100)
#mark distribution is discrete uniform
m <- sample(1:2, 100, replace=TRUE)
m <- factor(m, levels=1:2)
pp <- spatstat::ppp(x, y, c(0,1), c(0,1), marks=m)
# estimate the probability fields for each mark; since we have a discrete
# uniform for the mark distribution we should see probabilities about .5
# for both marks, as well as, the gamma credible sets should include 0,
# meaning that the marks are independent of location (probability .5 for
# each of the two mark values)
mpp_est <- est_MIPPP_cond_loc(pp, 0.1, hyper=0.2)
GetStats(mpp_est$gen_gammas[,1])$CredibleSet
GetStats(mpp_est$gen_gammas[,2])$CredibleSet
mpp_est <-est_MIPPP_cond_loc(pp, 0.3, hyper=0.2)
GetStats(mpp_est$gen_gammas[,1])$CredibleSet
GetStats(mpp_est$gen_gammas[,2])$CredibleSet
mpp_est <- est_MIPPP_cond_loc(pp, 0.5, hyper=0.2)
GetStats(mpp_est$gen_gammas[,1])$CredibleSet
GetStats(mpp_est$gen_gammas[,2])$CredibleSet
#Visualize the Tornado data about MO. We request to fit both the mark
#and ground process.
#plot the states, the tornado locations and the marks (strength of a tornado)
ret=PlotUSAStates(states=c('Iowa','Arkansas', 'Missouri','Illinois','Indiana',
 'Kentucky','Tennessee', 'Kansas','Nebraska','Texas','Oklahoma', 'Mississippi',
 'Alabama','Louisiana'), showcentroids=FALSE,shownames=TRUE, plotlevels = FALSE,
 main= "Tornadoes about MO, 2011")
#check out the mark values and their frequency
table(Tornadoes2011MO$marks)
#plot each point with a different shape according to its marks
ret$p+ggplot2::geom_point(data=as.data.frame( Tornadoes2011MO),ggplot2::aes(x=x,
 y=y,shape= as.factor(marks)))+ggplot2::guides(shape = ggplot2::guide_legend(
 title="Tornado power", ncol=2,byrow=TRUE))
#plot each point with a different color according to its marks
ret$p+ggplot2::geom_point(data=as.data.frame( Tornadoes2011MO),ggplot2::aes(x=x,
 y=y,color= as.factor(marks)))+ggplot2::guides(color = ggplot2::guide_legend(
 title="Tornado power", ncol=2,byrow=TRUE))
#plot each point with a different circle size according to its marks
ret$p+ggplot2::geom_point(data=as.data.frame( Tornadoes2011MO),ggplot2::aes(x=x,
 y=y,size=marks),shape=21)+ ggplot2::scale_size_continuous(breaks=sort(unique(
 Tornadoes2011MO$marks))) + ggplot2::guides(size =ggplot2::guide_legend(title=
 "Tornado power", ncol=2,byrow=TRUE))
# the marks must start from 1, recode the original
Tornadoes2011MO1=Tornadoes2011MO
Tornadoes2011MO1$marks=Tornadoes2011MO1$marks+1
mpp_est=est_MIPPP_cond_loc(Tornadoes2011MO1,r=1.5,hyper=0.01,
 startgamma = c(.1,.2,.3,.4,.5,.6),fit_groundIPPP=TRUE)
#Now generate an MIPPP with 3 marks
newMPP=rMIPPP_cond_loc(gammas=c(.1,.2,.5))
summary(newMPP)
plot(newMPP$surf,main="True IPPP intensity surface for the locations")
true_gammas=newMPP$gammas
genMPP=newMPP$genMPP
newMPP$r
mpp_est=est_MIPPP_cond_loc(genMPP,newMPP$r, hyper=0.2)
GetStats(mpp_est$gen_gammas[,1])$Mean
GetStats(mpp_est$gen_gammas[,2])$Mean
GetStats(mpp_est$gen_gammas[,3])$Mean
GetStats(mpp_est$gen_gammas[,1])$CredibleSet
GetStats(mpp_est$gen_gammas[,2])$CredibleSet
GetStats(mpp_est$gen_gammas[,3])$CredibleSet
summary(mpp_est)
plot(mpp_est)
plot(mpp_est,newMPP$surf)
## End(No test)




