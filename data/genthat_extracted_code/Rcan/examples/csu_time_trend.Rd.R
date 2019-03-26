library(Rcan)


### Name: csu_time_trend
### Title: csu_time_trend
### Aliases: csu_time_trend

### ** Examples


	data(csu_registry_data_2)

	# you can import your data from csv file using read.csv:
	# mydata <-  read.csv("mydata.csv", sep=",")

	# to select only 1 population 
	test <- csu_registry_data_2[csu_registry_data_2$registry_label=="Colombia, Cali",]

	# to change sex variable to factor with label
	test$sex <- factor(test$sex, levels=c(1,2), labels=c("Male", "Female"))

	# to calculate the asr
	df_asr <- csu_asr(
		test,missing_age = 99,
		group_by  = c("registry", "registry_label", "year", "sex"),
		var_age_group =  c("registry", "registry_label")
		)


	# plot ASR ove year, by sex.
	csu_time_trend(df_asr, group_by="sex",
			  plot_title = "Colombia, Liver")

	# plot ASR over year, by sex, with small smoothing.
	csu_time_trend(df_asr, group_by="sex",
			  plot_title = "Colombia, Liver",
			  smoothing = 0.3)

## No test: 
	# plot ASR over year, by sex, with high smoothing.
	csu_time_trend(df_asr, group_by="sex",
			  plot_title = "Colombia, Liver",
			  smoothing = 0.5)

	# Plot embedded in a graphic device
	pdf("test.pdf",width = 11.692 , height =  8.267) 
	csu_time_trend(df_asr, group_by="sex",
			  plot_title = "Colombia, Liver",
			  smoothing = 0.3)

	csu_time_trend(df_asr, group_by="sex",
			  plot_title = "Colombia, Liver",
			  smoothing = 0.5)

	dev.off()
## End(No test)			



