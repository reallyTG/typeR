library(phia)


### Name: interactionMeans
### Title: Calculate and Plot Adjusted Means for Interactions
### Aliases: interactionMeans plot.interactionMeans

### ** Examples

# Interaction between two factors
# See ?Adler for a description of the data set

mod.adler <- lm(rating ~ instruction * expectation, data=Adler)
(means.adler <- interactionMeans(mod.adler))
plot(means.adler, abbrev.levels=TRUE)


# Effect of factors on the slopes of the model
# See ?SLID for a description of the data set

SLID$logwages <- log2(SLID$wages)
mod.slid <- lm(logwages ~ education + age * (sex  * language), data=SLID)
(slopes.slid <- interactionMeans(mod.slid, slope="age"))
plot(slopes.slid)


# Include intra-subjects factors
# See ?OBrienKaiser for a description of the data set

mod.ok <- lm(cbind(pre.1, pre.2, pre.3, pre.4, pre.5, 
                     post.1, post.2, post.3, post.4, post.5, 
                     fup.1, fup.2, fup.3, fup.4, fup.5) ~  treatment*gender, 
                data=OBrienKaiser)

# Intra-subjects data:
phase <- factor(rep(c("pretest", "posttest", "followup"), each=5))
hour <- ordered(rep(1:5, 3))
idata <- data.frame(phase, hour)

# Calculate all interactions, but plot only the interactions between
# hour (represented in the x-axis) and the other factors (in traces)

means.ok <- interactionMeans(mod.ok, idata=idata)
plot(means.ok, atx="hour", traces=c("gender","treatment","phase"))



