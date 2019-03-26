library(lba)


### Name: plotlba
### Title: Plotlba objects using the approach suggested by van der Ark
###   (1999).
### Aliases: plotlba plotlba.lba.1d plotlba.lba.2d
### Keywords: lba plot

### ** Examples

data('votB')

#K = 2
ex1 <- lba(parties ~ city,
           data=votB,
           K = 2) 

plotlba(ex1)

#It's very simple. With colors!
plotlba(ex1,
        col.points = 1:6,
        col.lines  = 1:6)        

#Add title in plot!
plotlba(ex1,
        main='Mixing parameters')

#Change budget proportion!
plotlba(ex1,
        pch.budget = 23,
        col.budget = 9,
        colline.budget = 8,
        lwd.budget = 2,
        lty.budget = 2)

#A little more!
plotlba(ex1,
        xlab = 'Lb2 -> Lb1',
        height.line = rep(0.5,6),
        lty.lines = 2,
        args.legend = list(ncol=3))


## Not run: 
##D #K = 3
##D data(MANHATAN)
##D 
##D tbm <- xtabs(value ~ socecon+health, 
##D              MANHATAN) 
##D 
##D ex2 <- lba(tbm,
##D            K = 3) 
##D 
##D plotlba(ex2)
##D 
##D #A little more!
##D plotlba(ex2,
##D         labels.points = rownames(tbm),
##D         col.points    = 2:7,
##D         args.legend   = list(plot=F))
##D 
##D plotlba(ex2,
##D         col.points     = 3:8,
##D         col.budget     = 2,
##D         pch.budget     = 20,
##D         lty.budget     = 2,
##D         lwd.budget     = 3,
##D         colline.budget = 3,
##D         axis.labels    = c('Lba1','Lba2','Lba3'))
##D 
## End(Not run)



