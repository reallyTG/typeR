library(sbpiper)


### Name: plot_parameter_density
### Title: Plot parameter density.
### Aliases: plot_parameter_density

### ** Examples

dir.create(file.path("pe_plots"))
data(insulin_receptor_all_fits)
colnames(insulin_receptor_all_fits)[1] <- "ObjVal"
insulin_receptor_all_fits[,2:4] <- log10(insulin_receptor_all_fits[,2:4])
fileout <- file.path("pe_plots", "dens_k1.pdf")
plot_parameter_density(df=insulin_receptor_all_fits, 
                       parameter="k1", 
                       fileout=fileout) 



