library(ggmosaic)


### Name: product
### Title: Wrapper for a list
### Aliases: product

### ** Examples

data(Titanic)
titanic <- as.data.frame(Titanic)
titanic$Survived <- factor(titanic$Survived, levels=c("Yes", "No"))
ggplot(data=titanic) +
  geom_mosaic(aes(weight=Freq, x=product(Survived, Class), fill=Survived))



