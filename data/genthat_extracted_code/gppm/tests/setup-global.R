data("demoLGCM")
data('trueParas')
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
             demoLGCM,'ID','x')
parameterValues <- trueParas
mlValues <- c(57.86418519, -0.96213162,  4.42108943,  0.22716305,  0.95216303,  0.01003411)
names(mlValues) <- c('muI','muS','varI','covIS','varS','sigma')
lgcmFit <-fit(lgcm,init=mlValues)
modelForExtract <- lgcmFit
