library(caroline)


### Name: pies
### Title: Pie chart scatterplot
### Aliases: pies

### ** Examples


## these examples are to the default plot window, which can be slow
## try instead to plot to png or pdf for example

## example 1
  pies(
       list(
            a=nv(c(1,2,3),c('one','two','thre')),
            b=nv(c(2,2,3),c('one','two','thre')),
            c=nv(c(1,2,3),c('one','two','thre'))
            ),
       x0=c(0,.5,1),
       y0=c(0,.5,1), radii=6, border=c('gray', 'black', 'red')
       )


## example 2
n <- 200
n.groups <- 10
n.subgroups <-  6

grps <- paste('gene',seq(1,n.groups), sep='')[round(runif(n,1,n.groups))]
subgrps <- paste('species',seq(1,n.subgroups), sep='')[round(runif(n,1,n.subgroups))]
group.df <- cbind.data.frame(grps,subgrps)
subgroup.list <- by(group.df, group.df$grps, function(x) x$subgrps)

pie.list <- lapply(subgroup.list, table)
col.tab <- nv(rainbow(6), unique(subgrps))

pies(x=pie.list, x0=rnorm(n.groups), y0=rnorm(n.groups), 
     radii=10, show.labels=TRUE, show.slice.labels=TRUE, color.table=col.tab)


## example 3  reading from external flat file
## salt.df <- read.delim('/path/to/my/file.tab')
## create a dummy dataset that might live inside the above file
salt.df <- data.frame(salinity=rnorm(25,5), temperature=rnorm(25,25),spec_a=rpois(25,4), 
							   spec_b=rpois(25,4), 
							   spec_c=rpois(25,4), 
							   spec_d=rpois(25,4),
							   spec_e=rpois(25,4)
							   )
## pull out the colnumn names that are specific to pie wedge numbers	
salt.spec.nms <- names(salt.df)[grep('spec',names(salt.df))]
## turn them into a list
pie.list <- lapply(1:nrow(salt.df), 
 function(i) as.table(nv(as.vector(as.matrix(salt.df[i,salt.spec.nms])),salt.spec.nms)))
names(pie.list)<- letters[1:25]
with(salt.df, pies(x=pie.list, x0=salinity, y0=temperature, radii=2))




