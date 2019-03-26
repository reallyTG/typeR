library(fungible)


### Name: summary.monte
### Title: Summary Method for an Object of Class Monte
### Aliases: summary.monte print.summary.monte

### ** Examples

## set up a 'monte' run for the Fisher iris data

sk.lst <- list(c(0.120,  0.041,  0.106,  1.254),                     #
                c(0.105, -0.363, -0.607, -0.031),
                c(0.118,  0.366,  0.549, -0.129) )
              
              
kt.lst <- list(c(-0.253, 0.955,  1.022,  1.719),
                c(-0.533,-0.366,  0.048, -0.410),
                c( 0.033, 0.706, -0.154, -0.602))
                
cormat <- lapply(split(iris[,1:4],iris[,5]), cor)

my.iris <- monte(seed = 123, nvar = 4, nclus = 3, cor.list = cormat, 
	              clus.size = c(50, 50, 50),
                eta2 = c(0.619, 0.401, 0.941, 0.929), 
                random.cor = FALSE,
                skew.list = sk.lst, kurt.list = kt.lst, 
                secor = .3, 
                compactness = c(1, 1, 1), 
                sortMeans = TRUE)
summary(my.iris)



