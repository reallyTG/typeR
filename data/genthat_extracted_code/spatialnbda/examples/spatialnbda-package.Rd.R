library(spatialnbda)


### Name: spatialnbda
### Title: Performs spatial NBDA in a Bayesian context.
### Aliases: spatialnbda spatialnbda

### ** Examples

#library(SocialNetworks)


#------------------------------
#  calculating associations
#-------------------------------


# For a regular spatial point pattern with interaction radius = 0.06
# using an interaction function that uses pairwise Euclidean distances.

x = c(0.1023117, 0.1119260, 0.1625270, 0.3594291, 0.4220571, 0.4606205, 0.5927459,
 0.6847543, 0.7065195, 0.7760657, 0.9827536)

y = c(0.2525266, 0.3346728, 0.5275355, 0.2447207, 0.2765606, 0.4999600, 0.5928410,
 0.8356211, 0.2506116, 0.8994760, 0.1432255)

plot(x,y)
irset = c(rep(0.06,11))
calculateassociations(x,y,irset)


# For a clustered spatial point pattern with interaction radius=0.05
# using an interaction function that uses pairwise Euclidean distances.

 x =
  c(0.77302412, 0.82946034, 0.65776305, 0.62294479, 0.58577335, 0.39332654,
  0.36893684, 0.40518735, 0.53956642, 0.56596859, 0.62802969, 0.10380876,
 0.71058751, 0.65943692, 0.88056259, 0.90567566, 0.91166684, 0.89489341,
 0.92668619, 0.01544599, 0.30499431, 0.28249059, 0.30733518, 0.73165075,
 0.17712420, 0.80869511, 0.77351717, 0.75508022, 0.79445346, 0.73134413,
 0.62448310, 0.60180882, 0.66741081, 0.45884352, 0.45282315, 0.45614636,
 0.45270694, 0.44764728, 0.53259346)


 y=
 c(0.943378357, 0.933698623, 0.123641160, 0.146773076, 0.135097659, 0.978760171,
 0.981407654, 0.937111187, 0.080617391, 0.114438404, 0.061834776, 0.370322731,
 0.036576942, 0.003974257, 0.830356964, 0.837171526, 0.884801445, 0.797794654,
 0.844312417, 0.969982888, 0.672246284, 0.692111852, 0.671098280, 0.999097233,
 0.003736065, 0.255322335, 0.282689074, 0.310793806, 0.229047375, 0.266413304,
 0.324984514, 0.279652338, 0.287134158, 0.331962948, 0.365469720, 0.343868765,
0.378876999, 0.331915785, 0.368805652)


plot(x,y)
irset = c(rep(0.05,length(x)))
calculateassociations(x,y,irset)



# For a random spatial point pattern with interaction radius=0.05
# using an interaction function that uses pairwise Euclidean distances. 

  x =
 c( 0.74905296, 0.38309725, 0.98627509, 0.02242039, 0.54703348, 0.59173730,
 0.82340399, 0.18718650, 0.49200511, 0.86098261, 0.24848640, 0.15843825,
0.72875205 )
y  =
 c(0.73521480, 0.01661629, 0.51564570, 0.61856835, 0.20815448, 0.29431260,
 0.35507188, 0.18940107, 0.98721494, 0.98129752, 0.76510267, 0.43541222,
0.04601392)


plot(x,y)
irset = c(rep(0.1,length(x)))
calculateassociations(x,y,irset)


#---------------------------------------------------------------
#  Run spatial NBDA to estimate the social and asocial parameters
#  s and lambda.
#  The associations for the social network in this example are calculated
#  using an interaction function that assumes each individual has
#  an area of interaction or zone of influence.
#---------------------------------------------------------------




data(papertimes)
data(papernests)
data(x)
data(y)
z = array(0,c(length(x[,1]),1))# setting up array for storing spatial covariate information

for(i in 1:70){   # simulating spatial covariate information
xx = x[,1][i]
yy = y[,1][i]
z[i] = (3*xx + 14*yy) * exp(2 * (.4*xx - 1)) 
}



Times = papertimes[,1]
Ids = papernests[,1]
Diffusions = rep(1,length(Times))
Groups = rep(1,length(Times))
Events = c(1:length(Times))
socialites = matrix(1,nrow=70,ncol=70)


plot(x[,1],y[,1],xlab="x",ylab="y",cex=2,pch=16,main="Point pattern of nest positions")



areas = calculate.areas(x[,1],y[,1],rep(0.05,70),1000)
spatialareas = areas
len = length(x[,1])

spatialnetwork = matrix(0,nrow=len,ncol=len)
for(i in 1:len){
  for(j in i:len){ 
    template = spatialareas[[i]][j]
    spatialnetwork[i,j] = spatialnetwork[j,i] = template
    #spatialareas[[i]]=NULL
    
  }
  
}


shape = FormatData(Times,spatialnetwork,Ids,Groups,Diffusions,Events,spatialnetwork,z)
ptm <- proc.time()
mcmc(shape,10000,5,1,-5,-6)
proc.time() - ptm





