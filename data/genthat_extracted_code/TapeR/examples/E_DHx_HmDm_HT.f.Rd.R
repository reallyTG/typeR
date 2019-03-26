library(TapeR)


### Name: E_DHx_HmDm_HT.f
### Title: Calibrates a taper curve based on at least one diameter
###   measurement and returns the expected diameters and their variances,
###   volumes for parts or the complete stem and threshold heights given a
###   diameter.
### Aliases: E_DHx_HmDm_HT.f E_DHx_HmDm_HT_CIdHt.f E_HDx_HmDm_HT.f
###   E_VOL_AB_HmDm_HT.f

### ** Examples

## Let's take a look on the taper curve of the first tree in the
## example data set if it is only calibrated using the diameter
## measurement in 2m height.

#example data
data(DxHx.df)

#taper curve parameters based on all measured trees
data(SK.par.lme)

#select data of first tree
Idi <- (DxHx.df[,"Id"] == unique(DxHx.df$Id)[1]); DxHx.df[Idi,]
tree1 <- DxHx.df[Idi,]

## Predict the taper curve based on the diameter measurement in 2 m
## height and known height 
tc.tree1 <- E_DHx_HmDm_HT.f(Hx=1:tree1$Ht[1], Hm=tree1$Hx[3],
Dm=tree1$Dx[3], mHt = tree1$Ht[1], sHt = 0, par.lme = SK.par.lme) 

#plot the predicted taper curve
plot(tc.tree1$Hx, tc.tree1$DHx, type="l")
#lower CI
lines(tc.tree1$Hx, tc.tree1$CI_Mean[,1], lty=2)
#upper CI
lines(tc.tree1$Hx, tc.tree1$CI_Mean[,3], lty=2)
#lower prediction interval
lines(tc.tree1$Hx, tc.tree1$CI_Pred[,1], lty=3)
#upper prediction interval
lines(tc.tree1$Hx, tc.tree1$CI_Pred[,3], lty=3)
#add measured diameter
points(tree1$Hx[3], tree1$Dx[3], pch=3, col=2)
#add the observations
points(tree1$Hx, tree1$Dx)

## Add the population average taper curve (without calibration) to the
## plot (not of high practical interest but good to know how to get it).
Ht  = tree1$Ht[1]
Hx  = tree1$Hx
#get fixed-effects design matrix for the Splines
X = TapeR:::XZ_BSPLINE.f(x=Hx/Ht, par.lme = SK.par.lme)$X
#Calculate population average taper curve
DHx_PA = X %*% SK.par.lme$b_fix
#add to plot
lines(tree1$Hx, DHx_PA, lwd=2, lty=4)

## Let's see how CI's change if there's some uncertainty in the height
## measurement 
tc.tree1 <- E_DHx_HmDm_HT.f(Hx=1:tree1$Ht[1], Hm=tree1$Hx[3],
Dm=tree1$Dx[3], mHt = tree1$Ht[1], sHt = 1, par.lme = SK.par.lme) 

#plot the predicted taper curve
plot(tc.tree1$Hx, tc.tree1$DHx, type="l", xlab="Height (m)",
ylab="Diameter (cm)")
#lower CI
lines(tc.tree1$Hx, tc.tree1$CI_Mean[,1], lty=2)
#upper CI
lines(tc.tree1$Hx, tc.tree1$CI_Mean[,3], lty=2)
#lower prediction interval
lines(tc.tree1$Hx, tc.tree1$CI_Pred[,1], lty=3)
#upper prediction interval
lines(tc.tree1$Hx, tc.tree1$CI_Pred[,3], lty=3)
#add measured diameter
points(tree1$Hx[3], tree1$Dx[3], pch=3, col=2)
#add the observations
points(tree1$Hx, tree1$Dx)

## Not run: 
##D ## Calculate "exact" CIs. Careful: This takes a while!
##D #library(pracma)# for numerical integration with gaussLegendre()
##D tc.tree1.exact <- E_DHx_HmDm_HT_CIdHt.f(Hx=1:tree1$Ht[1],
##D Hm=tree1$Hx[3], Dm=tree1$Dx[3], mHt = tree1$Ht[1], sHt = 1, par.lme =
##D SK.par.lme) 
##D #add exact confidence intervals to approximate intervals above - fits
##D #quite well
##D lines(tc.tree1.exact[,1], tc.tree1.exact[,2], lty=2,col=2)
##D lines(tc.tree1.exact[,1], tc.tree1.exact[,4], lty=2,col=2)
##D 
##D 
##D ## Calculate the height given a certain diameter threshold, say 8.5 cm
##D ht.tree1.d8.5 <- E_HDx_HmDm_HT.f (Dx=8.5, Hm=tree1$Hx[3],
##D Dm=tree1$Dx[3], mHt = tree1$Ht[1], sHt = 1, par.lme = SK.par.lme) 
##D #add to above created plot
##D abline(v=ht.tree1.d8.5)
##D 
##D ## Calculate the timber volume
##D #for the whole stem
##D E_VOL_AB_HmDm_HT.f(Hm=tree1$Hx[3], Dm=tree1$Dx[3], mHt = tree1$Ht[1]
##D , sHt = 1, par.lme = SK.par.lme)
##D 
##D #Calculate the timber volume for a selected section given a height
##D #threshold (0.3 - 5 m)
##D E_VOL_AB_HmDm_HT.f(Hm=tree1$Hx[3], Dm=tree1$Dx[3], mHt = tree1$Ht[1]
##D , sHt = 1, par.lme = SK.par.lme, A=0.3, B=5, iDH = "H")
##D 
##D #Calculate the timber volume for a selected section given a diameter
##D #threshold (30 cm - 15 cm) (negative value if A<B)
##D E_VOL_AB_HmDm_HT.f(Hm=tree1$Hx[3], Dm=tree1$Dx[3], mHt = tree1$Ht[1]
##D , sHt = 1, par.lme = SK.par.lme, A=30, B=15, iDH = "D")
##D 
##D #The variance estimate resulting from the tree height uncertainty using
##D #a Normal approximation takes much longer...
##D ptm <- proc.time()
##D E_VOL_AB_HmDm_HT.f(Hm=tree1$Hx[3], Dm=tree1$Dx[3], mHt = tree1$Ht[1]
##D , sHt = 1, par.lme = SK.par.lme, IA=FALSE)
##D proc.time() - ptm
##D 
##D 
##D #... than the calculation using a 2-point distribution...
##D ptm <- proc.time()
##D E_VOL_AB_HmDm_HT.f(Hm=tree1$Hx[3], Dm=tree1$Dx[3], mHt = tree1$Ht[1]
##D , sHt = 1, par.lme = SK.par.lme, IA=TRUE)
##D proc.time() - ptm
##D 
##D #...fastest if no height variance is assumed
##D ptm <- proc.time()
##D E_VOL_AB_HmDm_HT.f(Hm=tree1$Hx[3], Dm=tree1$Dx[3], mHt = tree1$Ht[1]
##D , sHt = 0, par.lme = SK.par.lme, IA=FALSE)
##D proc.time() - ptm
##D 
##D #Also the number of supportive points for the numerical integration
##D #influences the calculation time
##D ptm <- proc.time()
##D E_VOL_AB_HmDm_HT.f(Hm=tree1$Hx[3], Dm=tree1$Dx[3], mHt = tree1$Ht[1]
##D , sHt = 0, par.lme = SK.par.lme, IA=FALSE, nGL=10)
##D proc.time() - ptm
## End(Not run)



