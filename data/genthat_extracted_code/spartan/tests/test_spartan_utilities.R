library(spartan)
context("Testing Spartan Utilities Class")

test_that("getMediansSubset", {

  # Subfunctions of this method are tested below - we just need to test
  # these all work together
  # Input has already been checked by the calling function

  # Make a result file:
  dir.create(file.path(getwd(),"1"))
  result <- cbind(4.4,86.5922532761)
  result <- rbind(result, cbind(4.7621290718,37.8444574614))
  result <- rbind(result, cbind(3.5112582903,52.5471704902))
  colnames(result) <- c("Velocity","Displacement")
  write.csv(result,file=file.path(getwd(),"1","Test_Results_CSV_file.csv"),row.names=F,quote=F)

  # Now see if we can get medians from this:
  medians <- getMediansSubset(getwd(), 1, c("Velocity","Displacement"),
                   "Test_Results_CSV_file.csv", altfilename = NULL, 1, 2)

  expect_equal(as.numeric(round(medians,digits=5)),c(4.40000,52.54717))

  # Now a file that does not exist
  # What will happen is the result for set 1 will be processed, the inner method will output a message
  # showing that a result is missing, but there will not be an error message and the execution
  # continues. So there should be one result returned
  expect_equal(nrow(getMediansSubset(getwd(), 2, c("Velocity","Displacement"),
                                  "Test_Results_CSV_file.csv", altfilename = NULL, 1, 2)),1)

  unlink(file.path(getwd(),"1"), recursive = TRUE)

})

test_that("partition_dataset", {

    arguments <- load_lhc_training_data()
    partitionedData <- partition_dataset(arguments$dataset,arguments$parameters, measures=arguments$measures, percent_train = 75, percent_test = 15,
                                       percent_validation = 10, seed = NULL,
                                       normalise = FALSE, sample_mins = arguments$sample_mins, sample_maxes = arguments$sample_maxes,
                                       timepoint = NULL)
    expect_equal(nrow(partitionedData$training),375)
    expect_equal(nrow(partitionedData$testing),75)
    expect_equal(nrow(partitionedData$validation),50)

    #expect_message(partition_dataset(arguments$dataset,arguments$parameters,percent_train = A, percent_test = 15,
    #                                     percent_validation = 10, seed = NULL,
    #                                     normalise = FALSE, sample_mins = arguments$sample_mins, sample_maxes = arguments$sample_maxes,
    #                                     timepoint = NULL),"Training, Testing, and Validation percentages have been declared incorrectly")

    #expect_message(partition_dataset(arguments$dataset,arguments$parameters,percent_train = "STRING", percent_test = 15,
    #                                 percent_validation = 10, seed = NULL,
    #                                 normalise = FALSE, sample_mins = arguments$sample_mins, sample_maxes = arguments$sample_maxes,
    #                                 timepoint = NULL),"Terminal Error in partition_dataset function. R Error String:\nnon-numeric argument to binary operatorSpartan Function Terminated")

    expect_message(partition_dataset(arguments$dataset,arguments$parameters,percent_train = 10, percent_test = 15,
                                     percent_validation = 10, seed = NULL,
                                     normalise = FALSE, sample_mins = arguments$sample_mins, sample_maxes = arguments$sample_maxes,
                                     timepoint = NULL),"Partition percentages do not add up to 100%. Terminated")

    file.remove(paste(getwd(),"/partitioned_data.Rda",sep=""))

})

test_that("normalise_dataset" , {

  arguments <- load_lhc_training_data()
  ranges_checked<-check_ranges(arguments$sample_mins, arguments$sample_maxes,arguments$parameters)
  normalised_set <- normalise_dataset(arguments$dataset, ranges_checked$sample_mins, ranges_checked$sample_maxes, arguments$parameters)
  expect_gte(min(normalised_set$scaled),0)
  expect_lte(max(normalised_set$scaled),1)

  # Build a dataset of two columns between -50 and 50
  x<- -50:50
  testDat <- cbind(sample(x,100),sample(x,100))
  colnames(testDat) <- c("A","B")
  ranges_checked<-check_ranges(cbind(-50,-50), cbind(50,50),c("A","B"))
  normalised_set <- normalise_dataset(testDat, ranges_checked$sample_mins, ranges_checked$sample_maxes, c("A","B"))
  expect_gte(min(normalised_set$scaled),0)
  expect_lte(max(normalised_set$scaled),1)

})

test_that("denormalise_dataset", {

  # Load in the required data and parameter arguments
  arguments <- load_lhc_training_data()
  ranges_checked<-check_ranges(arguments$sample_mins, arguments$sample_maxes,arguments$parameters)
  # Normalise dataset
  normalised_set <- normalise_dataset(arguments$dataset, ranges_checked$sample_mins, ranges_checked$sample_maxes, arguments$parameters)

  # Denormalise the set and it should be the same as the original
  transformedData <- denormalise_dataset(normalised_set$scaled[arguments$parameters], ranges_checked$sample_mins, ranges_checked$sample_maxes)

  expect_equal(transformedData, arguments$dataset[arguments$parameters])
})

test_that("make_path", {
  expect_match(make_path(c("/home/kja505/Desktop","outputFile.csv")),"/home/kja505/Desktop/outputFile.csv")
})

test_that("make_filename", {
  expect_match(make_filename(c("Curve","1","Parameter","2")),"Curve_1_Parameter_2")
})

test_that("make_extension", {
  expect_match(make_extension("outputFile","csv"),"outputFile.csv")
})

test_that("join_strings_space", {
  expect_match(join_strings_space(c("outputFile","1",".csv")),"outputFile 1 .csv")
})

test_that("join_strings", {
  expect_match(join_strings(c("outputFile","1","Param","2"),"_"),"outputFile_1_Param_2")
})

test_that("join_strings_nospace", {
  expect_match(join_strings_nospace(c("Curve","1")),"Curve1")
  })

test_that("prepare_parameter_value_list", {

  # Test that mins, max, and increment produces the correct sequences
  PMIN<-c(0,1)
  PMAX<-c(1,2)
  PINC<-c(0.1,0.25)
  PARAMVALS<-NULL
  PARAM_OF_INT<-1
  # First parameter should generate 11 samples:
  expect_length(prepare_parameter_value_list(PMIN,PMAX,PINC,PARAMVALS,PARAM_OF_INT),11)
  # Check values have been calculated correctly
  expect_equal(as.numeric(prepare_parameter_value_list(PMIN,PMAX,PINC,PARAMVALS,PARAM_OF_INT)),seq(PMIN[1],PMAX[1],by=PINC[1]))
  # Second should generate 5
  PARAM_OF_INT<-2
  expect_length(prepare_parameter_value_list(PMIN,PMAX,PINC,PARAMVALS,PARAM_OF_INT),5)
  # Check values have been calculated correctly
  expect_equal(as.numeric(prepare_parameter_value_list(PMIN,PMAX,PINC,PARAMVALS,PARAM_OF_INT)),seq(PMIN[2],PMAX[2],by=PINC[2]))
  # Test Paramvals
  PMIN<-NULL
  PMAX<-NULL
  PINC<-NULL
  PARAMVALS<-c("0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1","0, 0.25, 0.5, 0.75, 1")
  # Now repeat tests
  PARAM_OF_INT<-1
  expect_length(prepare_parameter_value_list(PMIN,PMAX,PINC,PARAMVALS,PARAM_OF_INT),11)
  expect_equal(as.numeric(prepare_parameter_value_list(PMIN,PMAX,PINC,PARAMVALS,PARAM_OF_INT)),as.numeric(strsplit(PARAMVALS[1],split=",")[[1]]))
  PARAM_OF_INT<-2
  expect_length(prepare_parameter_value_list(PMIN,PMAX,PINC,PARAMVALS,PARAM_OF_INT),5)
  expect_equal(as.numeric(prepare_parameter_value_list(PMIN,PMAX,PINC,PARAMVALS,PARAM_OF_INT)),as.numeric(strsplit(PARAMVALS[2],split=",")[[1]]))
})

test_that("subset_results_by_param_value_set", {

  # Tests subsetting - we can do this with the consistency analysis dataset
  data("tutorial_consistency_set")

  # Subset sample set 1, result set 2:
  sub_result <- subset_results_by_param_value_set(c("SampleSize", "Set"), tutorial_consistency_set, c(1, 2))
  expect_equal(nrow(sub_result),1)
  # Check this has caught two measures (as in the dataset, so 4 columns
  expect_equal(ncol(sub_result),4)
  # Check for sample size 300, that 300 rows are returned
  sub_result <- subset_results_by_param_value_set(c("SampleSize", "Set"), tutorial_consistency_set, c(300, 2))
  expect_equal(nrow(sub_result),300)

})

test_that(" write_data_to_csv", {
  write_data_to_csv(c(1,2,3,4),file.path(getwd(),"/TestFile.csv"))
  expect_true(file.exists(file.path(getwd(),"/TestFile.csv")))
  file.remove(file.path(getwd(),"/TestFile.csv"))
})

test_that("check_file_extension", {
  expect_equal(check_file_extension("File.csv"),"csv")
  expect_equal(check_file_extension("File.xml"),"xml")
  expect_equal(check_file_extension("File.pdf"),"pdf")
  expect_equal(check_file_extension("File.tiff"),"NULL")

})

test_that("get_median_results_for_all_measures", {

  # Read in the sample result set
  data(exemplar_sim_output)
  medians <- get_median_results_for_all_measures(exemplar_sim_output, c("Velocity","Displacement"))
  expect_equal(round(medians,digits=5),cbind(4.49823, 54.81939))
})

test_that("check_file_exists" , {

  expect_true(check_file_exists(getwd()))
  expect_message(check_file_exists(paste(getwd(),"/Folder",sep="")),paste(getwd(),"/Folder does not exist",sep=""))
})

