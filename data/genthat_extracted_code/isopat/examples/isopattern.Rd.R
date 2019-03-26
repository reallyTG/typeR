library(isopat)


### Name: isopattern
### Title: Isotopic pattern calculation
### Aliases: isopattern
### Keywords: methods misc

### ** Examples

## firstly, load list of isotope data ##########################################
data(iso_list);
iso_list;

## calculate isotopic peaks for coffein-D9 #####################################
peaks<-isopattern(iso_list,"C8H1N4O2D9",1e-10);
peaks;
# plot with y = absolute abundance
plot(peaks[,1],peaks[,2],type="h",xlab="mass",ylab="absolute abundance");
# plot with y = relative abundance scaled to the most intensive peak
peaks2<-peaks;
peaks2[,2]<-peaks2[,2]/max(peaks2[,2]);
plot(peaks2[,1],peaks2[,2],type="h",xlab="mass",ylab="relative abundance");
# plot with y = relative abundance scaled to the monoisotopic peak
# which, in this case, makes no difference
peaks2<-peaks;
peaks2[,2]<-peaks2[,2]/peaks2[1,2];
plot(peaks2[,1],peaks2[,2],type="h",xlab="mass",ylab="relative abundance");

## calculate isotopic peaks for the hypothetical compound Cl500 ################
# use a too low value for limit -> plot shows only two peaks:
system.time(peaks<-isopattern(iso_list,"Cl500",1e-10));
plot(peaks[,1],peaks[,2],type="h",xlab="mass",ylab="absolute abundance");
# reset limit to a very low value for this "difficult" compound, then plot again:
system.time(peaks<-isopattern(iso_list,"Cl500",1e-100));
plot(peaks[,1],peaks[,2],type="h",xlab="mass",ylab="absolute abundance");



