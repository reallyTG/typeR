library(osd)


### Name: plotOSDres
### Title: Plotting OSD objects
### Aliases: plotOSDres

### ** Examples

#load GC-MS sample data, containing three different metabolites 
#appearing in co-elution.
data(gcms1)

#resolve the situation using ICA-OSD algorithm
resolution <- osd(D=gcms1, k=3, res.method="ica.osd")

#plot the resolution, the extracted ion chromatogram (m/z) are plotted 
# in grey whereas the profile matrix appear in color.
plotOSDres(resolution, type="eic")
plotOSDres(resolution, type="tic")

#plot each resolved spectra for compound 1 to 3.
plotOSDres(resolution, type="s",1)
plotOSDres(resolution, type="s",2)
plotOSDres(resolution, type="s",3)



