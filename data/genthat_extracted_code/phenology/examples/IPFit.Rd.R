library(phenology)


### Name: IPFit
### Title: Fit a model of Internesting Period for marine turtles.
### Aliases: IPFit

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D data <- structure(c(`0` = 0, `1` = 47, `2` = 15, `3` = 6, `4` = 5, `5` = 4, 
##D                     `6` = 2, `7` = 5, `8` = 57, `9` = 203, `10` = 205, `11` = 103, 
##D                     `12` = 35, `13` = 24, `14` = 12, `15` = 10, `16` = 13, `17` = 49, 
##D                     `18` = 86, `19` = 107, `20` = 111, `21` = 73, `22` = 47, `23` = 30, 
##D                     `24` = 19, `25` = 17, `26` = 33, `27` = 48, `28` = 77, `29` = 83, 
##D                     `30` = 65, `31` = 37, `32` = 27, `33` = 23, `34` = 24, `35` = 22, 
##D                     `36` = 41, `37` = 42, `38` = 44, `39` = 33, `40` = 39, `41` = 24, 
##D                     `42` = 18, `43` = 18, `44` = 22, `45` = 22, `46` = 19, `47` = 24, 
##D                     `48` = 28, `49` = 17, `50` = 18, `51` = 19, `52` = 17, `53` = 4, 
##D                     `54` = 12, `55` = 9, `56` = 6, `57` = 11, `58` = 7, `59` = 11, 
##D                     `60` = 12, `61` = 5, `62` = 4, `63` = 6, `64` = 11, `65` = 5, 
##D                     `66` = 6, `67` = 7, `68` = 3, `69` = 2, `70` = 1, `71` = 3, `72` = 2, 
##D                     `73` = 1, `74` = 2, `75` = 0, `76` = 0, `77` = 3, `78` = 1, `79` = 0, 
##D                     `80` = 2, `81` = 0, `82` = 0, `83` = 1), Year = "1994", 
##D                     Species = "Dermochelys coriacea", 
##D                     location = "Yalimapo beach, French Guiana", 
##D                     totalnumber = 2526L, class = "IP")
##D   par(mar=c(4, 4, 1, 1)+0.4)
##D   plot(data, xlim=c(0,100))
##D   text(100, 190, labels=bquote(italic(.(attributes(data)$Species))), pos=2)
##D   text(100, 150, labels=attributes(data)$location, pos=2, cex=0.8)
##D   text(100, 110, labels=paste0(as.character(attributes(data)$totalnumber), " females"), pos=2)
##D   
##D ######### Fit using Maximum-Likelihood
##D 
##D par <- c(meanIP = 9.8229005713237623, 
##D          sdIP = 0.079176011861863474, 
##D          minIP = 6.8128364577569309, 
##D          pAbort = 1.5441529841959203, 
##D          meanAbort = 2.7958742380756121, 
##D          sdAbort = 0.99370406770777175, 
##D          pCapture = -0.80294884905867658, 
##D          meanECF = 4.5253772889275758, 
##D          sdECF = 0.20334743335612529)
##D 
##D fML <- IPFit(x=par, 
##D              fixed.parameters=c(N=20000),
##D              data=data, 
##D              verbose=FALSE, 
##D              model="ML")
##D 
##D # Plot the fitted ECF
##D plot(fML, result="ECF")
##D 
##D # Plot the Internesting Period distribution
##D plot(fML, result="IP")
##D 
##D # Plot the distribution of days between tentatives
##D plot(fML, result="Abort", xlim=c(0, 15))
##D #' 
##D ######### Fit using ML and non parametric ECF
##D 
##D par <- c(ECF.2 = 0.044151921569961131, 
##D          ECF.3 = 2.0020778325280748, 
##D          ECF.4 = 2.6128345101617083, 
##D          ECF.5 = 2.6450582416622375, 
##D          ECF.6 = 2.715198206774927, 
##D          ECF.7 = 2.0288031327239904, 
##D          ECF.8 = 1.0028041546528881, 
##D          ECF.9 = 0.70977432157689235, 
##D          ECF.10 = 0.086052204035003091, 
##D          ECF.11 = 0.011400419961702518, 
##D          ECF.12 = 0.001825219438794076, 
##D          ECF.13 = 0.00029398731859899116, 
##D          ECF.14 = 0.002784886479846703, 
##D          meanIP = 9.9887100433529721, 
##D          sdIP = 0.10580250625108811, 
##D          minIP = 6.5159124624132048, 
##D          pAbort = 2.5702251748938956, 
##D          meanAbort = 2.2721679285648841, 
##D          sdAbort = 0.52006431730489933, 
##D          pCapture = 0.079471782729506113)
##D          
##D fML_NP <- IPFit(x=par, 
##D              fixed.parameters=c(N=20000),
##D              data=data, 
##D              verbose=FALSE, 
##D              model="ML")
##D              
##D par <- fML_NP$ML$par
##D 
##D fML_NP <- IPFit(x=par, 
##D              fixed.parameters=c(N=1000000),
##D              data=data, 
##D              verbose=FALSE, 
##D              model="ML")
##D              
##D par <- c(ECF.2 = 0.016195025683080871, 
##D          ECF.3 = 2.0858089267994315, 
##D          ECF.4 = 3.1307578727979348, 
##D          ECF.5 = 2.7495760827322622, 
##D          ECF.6 = 2.8770821670450939, 
##D          ECF.7 = 2.1592708144943145, 
##D          ECF.8 = 1.0016227335391867, 
##D          ECF.9 = 0.80990178270345259, 
##D          ECF.10 = 0.081051214954249967, 
##D          ECF.11 = 0.039757901443389344, 
##D          ECF.12 = 6.3324056808464527e-05, 
##D          ECF.13 = 0.00037500864146146936, 
##D          ECF.14 = 0.0010383506745475582, 
##D          meanIP = 10.004121090603523, 
##D          sdIP = 0.10229422354470977, 
##D          minIP = 6.5051758088487883, 
##D          pAbort = 2.5335985958484839, 
##D          meanAbort = 2.3145895392189173, 
##D          sdAbort = 0.51192514362374153, 
##D          pCapture = 0.055440514236842105, 
##D          DeltameanIP = -0.046478049165483697)
##D 
##D fML_NP_Delta <- IPFit(x=par, 
##D              fixed.parameters=c(N=20000),
##D              data=data, 
##D              verbose=FALSE, 
##D              model="ML")
##D              
##D par <- fML_NP_Delta$ML$par
##D              
##D fML_NP_Delta <- IPFit(x=par, 
##D              fixed.parameters=c(N=1000000),
##D              data=data, 
##D              verbose=FALSE, 
##D              model="ML")
##D              
##D # Test for stability of -Ln L value according to N
##D grandL.mean <- NULL
##D grandL.sd <- NULL
##D N <- c(10000, 20000, 30000, 40000, 50000,
##D             60000, 70000, 80000, 90000,  
##D             100000, 200000, 300000, 400000, 500000, 
##D             600000, 700000, 800000, 900000,  
##D             1000000)
##D for (Ni in N) {
##D     print(Ni)
##D     smallL <- NULL
##D     for (replicate in 1:100) {
##D          smallL <- c(smallL, 
##D          getFromNamespace(".IPlnL", ns="phenology")
##D                  (x=par, fixed.parameters=c(N=Ni), data=data))
##D     }
##D     grandL.mean <- c(grandL.mean, mean(smallL))
##D     grandL.sd <- c(grandL.sd, sd(smallL))
##D }
##D 
##D grandL.mean <- c(242.619750064524, 239.596145944548, 238.640010536147, 237.965573853263, 
##D 237.727506424543, 237.240740566494, 237.527948232993, 237.297225856515, 
##D 237.17073080938, 237.103397800143, 236.855939567838, 
##D 236.704861853456, 236.82264801458, 236.606065021519, 236.685930841831, 
##D 236.697562908131, 236.568003663293, 236.58097471402, 236.594282543024
##D )
##D grandL.sd <- c(6.54334049298099, 3.04916614991682, 2.57932397492509, 2.15990307710982, 
##D 1.59826856034413, 1.54505295915354, 1.59734964880484, 1.41845032728396, 
##D 1.43096821211286, 1.20048923027244, 0.912467350448495, 
##D 0.75814052890774, 0.668841336554019, 0.539505594152166, 0.554662419326559, 
##D 0.501551009304687, 0.415199780254872, 0.472274287714195, 0.386237047201706
##D )
##D 
##D plot_errbar(x=N, y=grandL.mean, errbar.y = 2*grandL.sd, 
##D             xlab="N", ylab="-Ln L (2 SD)", bty="n", las=1)
##D              
##D # Plot the fitted ECF
##D plot(fML_NP_Delta, result="ECF")
##D 
##D # Plot the Internesting Period distribution
##D plot(fML_NP_Delta, result="IP")
##D 
##D # Plot the distribution of days between tentatives
##D plot(fML_NP_Delta, result="Abort", xlim=c(0, 15))
##D 
##D print(paste("Probability of capture", invlogit(-fML_NP_Delta$ML$par["pCapture"])))
##D # Confidence interval at 95%
##D print(paste(invlogit(-fML_NP_Delta$ML$par["pCapture"]-1.96*fML_NP_Delta$ML$SE["pCapture"]), "-", 
##D invlogit(-fML_NP_Delta$ML$par["pCapture"]+1.96*fML_NP_Delta$ML$SE["pCapture"])))
##D 
##D print(paste("Probability of abort", invlogit(-fML_NP_Delta$ML$par["pAbort"])))
##D # Confidence interval at 95%
##D print(paste(invlogit(-fML_NP_Delta$ML$par["pAbort"]-1.96*fML_NP_Delta$ML$SE["pAbort"]), "-", 
##D invlogit(-fML_NP_Delta$ML$par["pAbort"]+1.96*fML_NP_Delta$ML$SE["pAbort"])))
##D              
##D compare_AIC(parametric=fML$ML, 
##D             nonparameteric=fML_NP$ML, 
##D             nonparametricDelta=fML_NP_Delta$ML)
##D 
##D ######### Fit using Metropolis-Hastings algorithm
##D # ECF.1 = 1 is fixed
##D par <- c(ECF.2 = 0.044151921569961131, 
##D          ECF.3 = 2.0020778325280748, 
##D          ECF.4 = 2.6128345101617083, 
##D          ECF.5 = 2.6450582416622375, 
##D          ECF.6 = 2.715198206774927, 
##D          ECF.7 = 2.0288031327239904, 
##D          ECF.8 = 1.0028041546528881, 
##D          ECF.9 = 0.70977432157689235, 
##D          ECF.10 = 0.086052204035003091, 
##D          ECF.11 = 0.011400419961702518, 
##D          ECF.12 = 0.001825219438794076, 
##D          ECF.13 = 0.00029398731859899116, 
##D          ECF.14 = 0.002784886479846703, 
##D          meanIP = 9.9887100433529721, 
##D          sdIP = 0.10580250625108811, 
##D          minIP = 6.5159124624132048, 
##D          pAbort = 2.5702251748938956, 
##D          meanAbort = 2.2721679285648841, 
##D          sdAbort = 0.52006431730489933, 
##D          pCapture = 0.079471782729506113)
##D 
##D df <- data.frame(Density=rep("dunif", length(par)), 
##D Prior1=c(rep(0, 13), 8, 0.001, 0, -8, 0, 0.001, -8), 
##D Prior2=c(rep(10, 13), 12, 1, 10, 8, 2, 1, 8), 
##D SDProp=unname(c(ECF.2 = 6.366805760909012e-05, 
##D                 ECF.3 = 6.366805760909012e-05, 
##D                 ECF.4 = 6.366805760909012e-05, 
##D                 ECF.5 = 6.366805760909012e-05, 
##D                 ECF.6 = 6.366805760909012e-05, 
##D                 ECF.7 = 6.366805760909012e-05, 
##D                 ECF.8 = 6.366805760909012e-05, 
##D                 ECF.9 = 6.366805760909012e-05, 
##D                 ECF.10 = 6.366805760909012e-05, 
##D                 ECF.11 = 6.366805760909012e-05, 
##D                 ECF.12 = 6.366805760909012e-05, 
##D                 ECF.13 = 6.366805760909012e-05, 
##D                 ECF.14 = 6.366805760909012e-05, 
##D                 meanIP = 6.366805760909012e-05, 
##D                 sdIP = 6.366805760909012e-05, 
##D                 minIP = 6.366805760909012e-05, 
##D                 pAbort = 6.366805760909012e-05, 
##D                 meanAbort = 6.366805760909012e-05, 
##D                 sdAbort = 6.366805760909012e-05, 
##D                 pCapture = 6.366805760909012e-05)),               
##D Min=c(rep(0, 13), 8, 0.001, 0, -8, 0, 0.001, -8), 
##D Max=c(rep(10, 13), 12, 1, 10, 8, 2, 1, 8),
##D Init=par, stringsAsFactors = FALSE)
##D rownames(df)<- names(par)
##D 
##D fMH <- IPFit(parametersMH=df, 
##D fixed.parameters=c(N=10000),
##D data=data, 
##D verbose=FALSE, 
##D n.iter = 10000,
##D n.chains = 1, n.adapt = 100, thin = 1, trace = TRUE,
##D adaptive = TRUE, 
##D model="MH")
##D 
##D # Plot the fitted ECF
##D plot(fMH, result="ECF")
##D 
## End(Not run)



