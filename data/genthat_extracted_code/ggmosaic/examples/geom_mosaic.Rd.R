library(ggmosaic)


### Name: geom_mosaic
### Title: Mosaic plots.
### Aliases: geom_mosaic stat_mosaic

### ** Examples


data(Titanic)
titanic <- as.data.frame(Titanic)
titanic$Survived <- factor(titanic$Survived, levels=c("Yes", "No"))


ggplot(data=titanic) +
  geom_mosaic(aes(weight=Freq, x=product(Class), fill=Survived))
# good practice: use the 'dependent' variable (or most important variable)
# as fill variable

ggplot(data=titanic) +
  geom_mosaic(aes(weight=Freq, x=product(Class, Age), fill=Survived))

ggplot(data=titanic) +
  geom_mosaic(aes(weight=Freq, x=product(Class), conds=product(Age), fill=Survived))
ggplot(data=titanic) +
  geom_mosaic(aes(weight=Freq, x=product(Survived, Class), fill=Age))

# Just excluded for timing. Examples are included in testing to make sure they work
## Not run: 
##D data(happy, package="productplots")
##D 
##D ggplot(data = happy) + geom_mosaic(aes(x=product(happy)), divider="hbar")
##D ggplot(data = happy) + geom_mosaic(aes(x=product(happy))) +
##D   coord_flip()
##D # weighting is important
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight=wtssall, x=product(happy)))
##D ggplot(data = happy) + geom_mosaic(aes(weight=wtssall, x=product(health), fill=happy)) +
##D   theme(axis.text.x=element_text(angle=35))
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight=wtssall, x=product(health), fill=happy), na.rm=TRUE)
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight=wtssall, x=product(health, sex, degree), fill=happy),
##D   na.rm=TRUE)
##D 
##D # here is where a bit more control over the spacing of the bars is helpful:
##D # set labels manually:
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight=wtssall, x=product(age), fill=happy), na.rm=TRUE, offset=0) +
##D   scale_x_productlist("Age", labels=c(17+1:72))
##D # thin out labels manually:
##D labels <- c(17+1:72)
##D labels[labels %% 5 != 0] <- ""
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight=wtssall, x=product(age), fill=happy), na.rm=TRUE, offset=0) +
##D   scale_x_productlist("Age", labels=labels)
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight=wtssall, x=product(age), fill=happy, conds = product(sex)),
##D   divider=mosaic("v"), na.rm=TRUE, offset=0.001) +
##D   scale_x_productlist("Age", labels=labels)
##D # facetting works!!!!
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight=wtssall, x=product(age), fill=happy), na.rm=TRUE, offset = 0) +
##D   facet_grid(sex~.) +
##D   scale_x_productlist("Age", labels=labels)
##D 
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight = wtssall, x = product(happy, finrela, health)),
##D   divider=mosaic("h"))
##D ggplot(data = happy) +
##D   geom_mosaic(aes(weight = wtssall, x = product(happy, finrela, health)), offset=.005)
##D 
##D # Spine example
##D ggplot(data = happy) +
##D  geom_mosaic(aes(weight = wtssall, x = product(health), fill = health)) +
##D  facet_grid(happy~.)
## End(Not run) # end of don't run



