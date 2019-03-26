library(Rcan)


### Name: csu_ageSpecific
### Title: csu_ageSpecific
### Aliases: csu_ageSpecific

### ** Examples


data(csu_registry_data_1)
data(csu_registry_data_2)

# you can import your data from csv file using read.csv:
# mydata <-  read.csv("mydata.csv", sep=",")

# to select only 1 population.
test <- csu_registry_data_1[csu_registry_data_1$registry_label=="Colombia, Cali",]

# plot age specific rate for 1 population.
csu_ageSpecific(test,
				plot_title = "Colombia, Liver, male")

# plot age specific rate for 1 population, and comparison with CI5X data.
csu_ageSpecific(test,
				plot_title = "Colombia, Liver, male",
				CI5_comparison = "Liver")

# plot age specific rate for 4 population, 
# legend at the bottom and comparison with CI5X data.
csu_ageSpecific(
	csu_registry_data_1,
	group_by="registry_label",
	legend=csu_trend_legend(position="bottom", nrow = 1),
	plot_title = "Liver, male",
	CI5_comparison = 7
	)

	
## No test: 
# plot age specific rate for 4 population, legend at the right.
csu_ageSpecific(
	csu_registry_data_1,
	group_by="registry_label",
	legend=csu_trend_legend(
		position="right", right_space_margin = 6.5
	),
	plot_title = "Liver, male")	



# Plot embedded in a graphic device
pdf("test.pdf",width = 11.692 , height =  8.267) 


csu_ageSpecific(
	csu_registry_data_1,
	group_by="registry_label",
	legend=csu_trend_legend(position="bottom", nrow = 2),
	plot_title = "Liver, male",
	CI5_comparison = 7)

plot.new()

csu_ageSpecific(
	csu_registry_data_1,
	group_by="registry_label",
	legend=csu_trend_legend(
		position="right", right_space_margin = 6.5
	),
	plot_title = "Liver, male")	



dev.off()

## End(No test)



	



