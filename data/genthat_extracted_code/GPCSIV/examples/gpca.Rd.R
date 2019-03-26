library(GPCSIV)


### Name: gpca
### Title: Main function gpca, Generalized Principal Component of Symbolic
###   Interval variables
### Aliases: gpca

### ** Examples

data(Judge1)
data(Judge2)
data(Judge3)

preparation1<-Resdata(list(Judge1,Judge2,Judge3))
List1min<-preparation1$tablemin
List1max<-preparation1$tablemax

# example 1 with the use of some parameters by default
example1<-gpca(xmin=List1min,xmax=List1max,nomInd=paste('Region',1:6),
              nomVar=c('Banana','Coffee','Thea','Cocoa'))

# example 1 with visualization of table containing the coordinates
# of the individuals onto the principal axes
example1<-gpca(xmin=List1min,xmax=List1max,nomInd=paste('Region',1:6),nomVar=c('Banana',
              'Coffee','Thea','Cocoa'),axes=c(1,2),axes2=c(1,2,3),plot3d.table=c(1:3),
			   nametable=paste('Expert',1:3,sep='-'))

# example 1 with visualization of the table 2 and 3 containing
#the coordinates of the individuals onto the principal axes
example1<-gpca(xmin=List1min,xmax=List1max,nomInd=paste('Region',1:6),
              nomVar=c('Banana','Coffee','Thea','Cocoa'),axes=c(1,2),
			  axes2=c(1,2,3),plot3d.table=c(2:3))

#### print numeric output of example1
# input tables onto the axes of the compromise
example1$PCinterval

# Principal components of the compromise
example1$PCCompromise

# Correlation between initial interval variables and principal
#component of the compromise
example1$Correl

# print eigenvalue, % of variance, cumulative % percentage
# of PCA of the compromise
example1$Pval


data(video1)
data(video2)
data(video3)
preparation2<-Resdata(list(video1,video2,video3))
List2min<-preparation2$tablemin
List2max<-preparation2$tablemax

# example2 : analysis of video dataset
example2<-gpca(xmin=List2min,xmax=List2max,nomVar=c('nvisit','nwatch',
'nlike','ncoment','nshare'),
nametable=paste('Video', 1:3))

# example2 : analysis of video dataset with the 3D graphics
example2<-gpca(xmin=List2min,xmax=List2max,nomVar=c('nvisit',
'nwatch','nlike','ncoment','nshare'),nametable=paste('Video', 1:3),
nomInd=paste('Obs',1:10),plot3d.table=c(1,2,3))


data(oils)
preparation3<-Resdata(list(oils))
List3min<-preparation3$tablemin
List3max<-preparation3$tablemax

# example3 Interval Principal component analysis based on min and max
example3<-gpca(xmin=List3min,xmax=List3max,nomInd=rownames(oils),
nomVar=c('Gravity','Freezing','Iodine','Saponification'))

#### print numeric output of example3

# interval Principal components
example3$PCinterval

# Correlation between initial interval variables and principal
#components
example3$Correl

# print eigenvalue, % of variance, cumulative % percentage
# of PCA of the compromise
example3$Pval

# example3 Interval Principal component analysis based on min and max
#with standardisation of variables
example3bis<-gpca(xmin=List3min,xmax=List3max,nomInd=rownames(oils),
nomVar=c('Gravity','Freezing','Iodine','Saponification'),reduire=1)

# interval Principal components
example3bis$PCinterval

# Correlation between initial interval variables and principal
#components
example3bis$Correl

# print eigenvalue, % of variance, cumulative % percentage
# of PCA of the compromise
example3bis$Pval



