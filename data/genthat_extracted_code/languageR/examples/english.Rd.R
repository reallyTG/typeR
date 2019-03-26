library(languageR)


### Name: english
### Title: English visual lexical decision and naming latencies
### Aliases: english english
### Keywords: datasets

### ** Examples
## Not run: 
##D data(english)
##D 
##D # ---- orthogonalize orthographic consistency measures
##D 
##D items = english[english$AgeSubject == "young",]
##D items.pca = prcomp(items[ , c(18:27)], center = TRUE, scale = TRUE)
##D x = as.data.frame(items.pca$rotation[,1:4])
##D items$PC1 =  items.pca$x[,1]
##D items$PC2 =  items.pca$x[,2]
##D items$PC3 =  items.pca$x[,3]
##D items$PC4 =  items.pca$x[,4]
##D items2 = english[english$AgeSubject != "young", ]
##D items2$PC1 =  items.pca$x[,1]
##D items2$PC2 =  items.pca$x[,2]
##D items2$PC3 =  items.pca$x[,3]
##D items2$PC4 =  items.pca$x[,4]
##D english = rbind(items, items2) 
##D 
##D # ---- add Noun-Verb frequency ratio
##D 
##D english$NVratio = log(english$NounFrequency+1)-log(english$VerbFrequency+1)
##D 
##D # ---- build model with ols() from rms
##D 
##D library(rms)
##D english.dd = datadist(english)
##D options(datadist = 'english.dd')
##D 
##D english.ols = ols(RTlexdec ~ Voice + PC1 + MeanBigramFrequency + 
##D    rcs(WrittenFrequency, 5) + rcs(WrittenSpokenFrequencyRatio, 3) + 
##D    NVratio + WordCategory + AgeSubject +
##D    rcs(FamilySize, 3) + InflectionalEntropy + 
##D    NumberComplexSynsets + rcs(WrittenFrequency, 5) : AgeSubject,
##D    data = english, x = TRUE, y = TRUE)
##D 
##D # ---- plot partial effects
##D 
##D plot(Predict(english.ols))
##D 
##D # ---- validate the model
##D 
##D validate(english.ols, bw = TRUE, B = 200)
##D 
## End(Not run)


