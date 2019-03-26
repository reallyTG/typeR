library(RAPTOR)


### Name: write.output
### Title: Output generation and visualization
### Aliases: write.output

### ** Examples

## Not run: 
##D #example to write output
##D input<-is.raptor(example.data(species="SIB_LARIX"), str = FALSE)
##D aligned<-align(input)
##D first<-first.cell(aligned, frac.small = 0.5, yrs = FALSE, make.plot = FALSE)
##D output<-pos.det(first, swe = 0.3, sle = 3, ec = 1.5, swl = 0.5, sll = 5, lc = 15,
##D                 prof.co = 4, max.cells = 0.5, yrs = FALSE, aligning = FALSE, make.plot = FALSE)
##D sib_larix<-write.output(output)
##D 
##D #removing rows which are unsuitable
##D corrections<-data.frame(year=c(2010,2010,2010,2009,2009,2009,2009,2008,2008,
##D                         2008,2008,2008,2008,2007,2007,2007),
##D                         row=c(19,15,9,6,11,14,17,5,6,14,17,24,15,2,8,14))
##D for(i in c(1:nrow(corrections))){
##D sib_larix[which(sib_larix[,"YEAR"]==corrections[i,1]  &
##D           sib_larix[,"ROW"]==corrections[i,2] ),"POSITION"]<-rep(NA,length(sib_larix[
##D           which(sib_larix[,"YEAR"]==corrections[i,1]& sib_larix[,"ROW"]==corrections[i,2] ),
##D           "POSITION"]))
##D sib_larix[which(sib_larix[,"YEAR"]==corrections[i,1]  &
##D           sib_larix[,"ROW"]==corrections[i,2] ),"ROW"]<-rep(NA,length(sib_larix[
##D           which(sib_larix[,"YEAR"]==corrections[i,1]&sib_larix[,"ROW"]==corrections[i,2] ),
##D           "POSITION"]))}
##D SIB_LARIX<-write.output(sib_larix)
##D for(i in c(1:length(unique(SIB_LARIX[,"YEAR"])))){
##D row_id<-unique(SIB_LARIX[which(SIB_LARIX[,"YEAR"]==unique(SIB_LARIX[,"YEAR"])[i]),"ROW"],
##D                na.rm=TRUE)
##D row_id<-na.omit(row_id[order(row_id)])
##D for(j in c(1:length(row_id))){
##D SIB_LARIX[which(SIB_LARIX[,"YEAR"]==unique(SIB_LARIX[,"YEAR"])[i] &
##D           SIB_LARIX[,"ROW"]==row_id[j]), "ROW"]<-j
##D }}
## End(Not run)



