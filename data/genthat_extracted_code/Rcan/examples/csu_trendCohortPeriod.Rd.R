library(Rcan)


### Name: csu_trendCohortPeriod
### Title: csu_trendCohortPeriod
### Aliases: csu_trendCohortPeriod

### ** Examples


	data(csu_registry_data_2)

	# you can import your data from csv file using read.csv:
	# mydata <-  read.csv("mydata.csv", sep=",")
	
	# to select only 1 population 
	test <- csu_registry_data_2[csu_registry_data_2$registry == 84020,]
	test <- test[test$sex==1,]

	
	# plot cohort graph from 25-29 years until 75-79 years.
	csu_trendCohortPeriod(df_data=test,
                        missing_age =99,
                        plot_title = "USA, Liver, males")
						
	# plot Period graph from 0-5 until 85+.
	csu_trendCohortPeriod(df_data=test,
                        missing_age =99,
                        plot_title = "USA, Liver, males",
						type="Period",
						first_age=1,
						last_age=18)
						
	# plot Cohort-Period graph from 30-64 years until 70-74 years.
	csu_trendCohortPeriod(df_data=test,
                        missing_age =99,
                        plot_title = "USA, Liver, males",
						type="Both",
						first_age=7,
						last_age=15)

	# plot Cohort-Period graph from 30-64 years until 70-74 years with Y axis normal scale.
	csu_trendCohortPeriod(df_data=test,
                        missing_age =99,
                        plot_title = "USA, Liver, males",
						type="Both",
						first_age=7,
						last_age=15,
						logscale=FALSE)

## No test: 
					
	# plot Cohort graph from 25-29 years until 75-79 years, with data grouped in 2 years period.
	csu_trendCohortPeriod(df_data=test,
						  missing_age =99,
						  plot_title = "USA, Liver, males",
						  type="Cohort",
						  year_group = 2)
						  
	# Plot embedded in a graphic device
	pdf("example_test.pdf")
	csu_trendCohortPeriod(df_data=test,
                        missing_age =99,
                        plot_title = "USA, Liver, males",
						type="Both",
						first_age=7,
						last_age=15,
						graph_dev=TRUE)
			  
	csu_trendCohortPeriod(df_data=test,
                        missing_age =99,
                        plot_title = "USA, Liver, males",
						type="Both",
						first_age=7,
						last_age=15,
						logscale=FALSE)
				
	dev.off()
## End(No test)		



