library(sbpiper)


### Name: plot_sampled_2d_ple
### Title: Plot 2D profile likelihood estimations.
### Aliases: plot_sampled_2d_ple

### ** Examples

dir.create(file.path("pe_plots"))
data(insulin_receptor_all_fits)
colnames(insulin_receptor_all_fits)[1] <- "ObjVal"
insulin_receptor_all_fits[,2:4] <- log10(insulin_receptor_all_fits[,2:4])
fileout <- file.path("pe_plots", "2d_ple_k1_k2.pdf")
plot_sampled_2d_ple(df=insulin_receptor_all_fits, 
                    parameter1="k1", 
                    parameter2="k2", 
                    fileout=fileout) 



