library(clv)


### Name: similarity.index
### Title: Similarity index based on confusion matrix - External Measure,
###   Cluster Stability
### Aliases: similarity.index
### Keywords: cluster

### ** Examples

# similarity.index function(and also dot.product) is used to compute 
# cluster stability, additional stability functions will be 
# defined - as its arguments some additional functions (wrappers) 
# will be needed

# define wrappers
pam.wrapp <-function(data)
{
	return( as.integer(data$clustering) )
}

identity <- function(data) { return( as.integer(data) ) }

agnes.average <- function(data, clust.num)
{
	return( cutree( agnes(data,method="average"), clust.num ) )
}

# define cluster stability function - cls.stabb

# cls.stabb arguments description:
# data - data to be clustered
# clust.num - number of clusters to which data will be clustered
# sample.num - number of pairs of data subsets to be clustered,
#              each clustered pair will be given as argument for 
#              dot.product and similarity.index functions 
# ratio - value comming from (0,1) section: 
#		  0 - means sample emtpy subset,
#		  1 - means chose all "data" objects
# method - cluster method (see wrapper functions)
# wrapp - function which extract information about cluster id assigned 
#         to each clustered object 

# as a result mean of similarity.index (and dot.product) results,
# computed for subsampled pairs of subsets is given
cls.stabb <- function( data, clust.num, sample.num , ratio, method, wrapp  )
{
	dot.pr  = 0
	sim.ind = 0
	obj.num = dim(data)[1]

	for( j in 1:sample.num )
	{
		smp1 = sort( sample( 1:obj.num, ratio*obj.num ) )
		smp2 = sort( sample( 1:obj.num, ratio*obj.num ) )

		d1 = data[smp1,]
		cls1 = wrapp( method(d1,clust.num) )

		d2 = data[smp2,]
		cls2 = wrapp( method(d2,clust.num) )

		clsm1 = t(rbind(smp1,cls1))
		clsm2 = t(rbind(smp2,cls2))

		m = cls.set.section(clsm1, clsm2)
		cls1 = as.integer(m[,2])
		cls2 = as.integer(m[,3])
		cnf.mx = confusion.matrix(cls1,cls2)
		std.ms = std.ext(cls1,cls2)
		
		# external measures - compare partitioning
		dt = dot.product(cls1,cls2)
		si = similarity.index(cnf.mx)

		if( !is.nan(dt) ) dot.pr = dot.pr + dt/sample.num 
		sim.ind = sim.ind + si/sample.num 
	}
	return( c(dot.pr, sim.ind) )
}

# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# fix arguments for cls.stabb function
iter = c(2,3,4,5,6,7,9,12,15)
smp.num = 5
sub.smp.ratio = 0.8

# cluster stability for PAM
print("PAM method:")
for( i in iter )
{
	result = cls.stabb(iris.data, clust.num=i, sample.num=smp.num,
            ratio=sub.smp.ratio, method=pam, wrapp=pam.wrapp)
	print(result)
}

# cluster stability for Agnes (average-link)
print("Agnes (single) method:")
for( i in iter )
{
	result = cls.stabb(iris.data, clust.num=i, sample.num=smp.num,
            ratio=sub.smp.ratio, method=agnes.average, wrapp=identity)
	print(result)
}



