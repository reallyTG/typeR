library(chillR)


### Name: make_pheno_trend_plot
### Title: Make image showing phenology response to temperatures during two
###   phases
### Aliases: make_pheno_trend_plot
### Keywords: analysis phenology

### ** Examples


weather<-fix_weather(KA_weather)

#the output of the PLS function (PLS_pheno, plotted with plot_PLS) can be used to select
#phases that are likely relevant for plant phase timing. See respective examples for running
#these functions.

file_path<-paste(getwd(),"/",sep="")

mpt<-make_pheno_trend_plot(weather_data_frame = weather$weather, split_month = 6,
     pheno = KA_bloom, use_Tmean = FALSE, Start_JDay_chill = 260, 
     End_JDay_chill = 64, Start_JDay_heat = 44, End_JDay_heat = 103,
     outpath = file_path, file_name = "pheno_trend_plot",
     plot_title = "Impacts of chilling and forcing temperatures on cherry phenology",
     ylabel = NA, xlabel = NA, legend_label = NA, image_type = "png", 
     colorscheme = "normal")




