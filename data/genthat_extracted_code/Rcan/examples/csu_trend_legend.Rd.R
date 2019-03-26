library(Rcan)


### Name: csu_trend_legend
### Title: csu_trend_legend
### Aliases: csu_trend_legend

### ** Examples


data(csu_registry_data_1)

csu_ageSpecific(csu_registry_data_1,
                group_by="registry_label",
                legend=csu_trend_legend(title="registry", position="bottom", nrow = 2),
                plot_title = "Legend: bottom")
				
csu_ageSpecific(csu_registry_data_1,
                group_by="registry_label",
                legend=csu_trend_legend(position="right", right_space_margin = 2),
                plot_title = "Legend: right, cut")

csu_ageSpecific(csu_registry_data_1,
                group_by="registry_label",
                legend=csu_trend_legend(position="right", right_space_margin = 6.5),
                plot_title = "Legend: right")
				
#See more examples here:
help(csu_ageSpecific)
	  		  



