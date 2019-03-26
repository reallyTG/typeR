library(Ecdat)


### Name: politicalKnowledge
### Title: Political knowledge in the US and Europe
### Aliases: politicalKnowledge
### Keywords: datasets

### ** Examples

##
## 1. Combine first 2 rows 
##
data(politicalKnowledge)
pk <- politicalKnowledge[-1,]
pk[1, -1] <- ((politicalKnowledge[1, -1] + 
                 politicalKnowledge[2, -1])/2)
pk[1, 'country'] <- 'DK-FI'

##
## 2.  plot
##
xlim <- range(pk[, 'PublicMediaPerCapita'])
ylim <- 100*range(pk[2:7])
text.cex <- 2

# to label the lines 
(US.UK <- (pk[2, -1]+pk[3, -1])/2)

#png('Knowledge v. public media.png')
op <- par(mar=c(5, 7, 4, 2)+.1)
plot(c(0, 110), 100*ylim, type='n', axes=FALSE,
     xlab='public media $ per capita',
     ylab='Political Knowledge\n(% of standard questions)',
     cex.lab=2)
axis(1, cex.axis=2)
axis(2, las=2, cex.axis=2)
with(pk, text(PublicMediaPerCapita, 100*PoliticalKnowledge.hs,
              country, cex=text.cex, xpd=NA, 
              col=c('forestgreen', 'orange', 'red')))
with(pk, text(PublicMediaPerCapita, 100*PoliticalKnowledge.sc,
              country, cex=text.cex, xpd=NA, 
              col=c('forestgreen', 'orange', 'red')))
with(pk, text(PublicMediaPerCapita, 100*PoliticalKnowledge.c,
              country, cex=text.cex, xpd=NA, 
              col=c('forestgreen', 'orange', 'red')))
with(pk, lines(PublicMediaPerCapita, 100*PoliticalKnowledge.hs,
               type='b', pch=' '))
with(pk, lines(PublicMediaPerCapita, 100*PoliticalKnowledge.sc,
               type='b', pch=' '))
with(pk, lines(PublicMediaPerCapita, 100*PoliticalKnowledge.c,
               type='b', pch=' '))
with(US.UK, text(PublicMediaPerCapita, 100*PoliticalKnowledge.hs,
                 'High School\nor less', srt=37, cex=1.5))
with(US.UK, text(PublicMediaPerCapita, 100*PoliticalKnowledge.sc,
                 'some\ncollege', srt=10.5, cex=1.5))
with(US.UK, text(PublicMediaPerCapita, 100*PoliticalKnowledge.c,
                 "Bachelor's\nor more", srt=-1, cex=1.5))

par(op)
#dev.off()

##
## redo for Wikimedia commons
## without English axis labels 
## to facilitate multilingual use 
##
#svg('Knowledge v. public media.svg')
op <- par(mar=c(3,3,2,2)+.1)
plot(c(0, 110), 100*ylim, type='n', axes=FALSE,
     xlab='', ylab='', cex.lab=2)
axis(1, cex.axis=2)
axis(2, las=2, cex.axis=2)
with(pk, text(PublicMediaPerCapita, 100*PoliticalKnowledge.hs,
              country, cex=text.cex, xpd=NA, 
              col=c('forestgreen', 'orange', 'red')))
with(pk, text(PublicMediaPerCapita, 100*PoliticalKnowledge.sc,
              country, cex=text.cex, xpd=NA, 
              col=c('forestgreen', 'orange', 'red')))
with(pk, text(PublicMediaPerCapita, 100*PoliticalKnowledge.c,
              country, cex=text.cex, xpd=NA, 
              col=c('forestgreen', 'orange', 'red')))
with(pk, lines(PublicMediaPerCapita, 100*PoliticalKnowledge.hs,
               type='b', pch=' '))
with(pk, lines(PublicMediaPerCapita, 100*PoliticalKnowledge.sc,
               type='b', pch=' '))
with(pk, lines(PublicMediaPerCapita, 100*PoliticalKnowledge.c,
               type='b', pch=' '))
par(op)
#dev.off()




