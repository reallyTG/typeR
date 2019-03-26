library(spartan)
library(XML)
context("Test of Spartan Netlogo eFAST Sampling")

test_that("efast_generate_sample_netlogo", {

  skip_on_cran()

  # Generate the samples, then we'll check the content
  # eFAST sampling has been tested independently, within that method

  efast_generate_sample_netlogo(
    FILEPATH=getwd(), 3, 65,
    c("death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick"),
    c("people","infectiousness","dummy"),
    c(150,"[10,90]","[1,10]"),
    1,"true","setup","go")

   # Test the sample files have been generated
   expect_true(file.exists(paste(getwd(),"/Curve1_infectiousness.csv",sep="")))
   expect_true(file.exists(paste(getwd(),"/Curve1_dummy.csv",sep="")))

   # Now we can check the content of a random file
   xml_doc <- read_created_efast_xml_file()

   # Now compare the results
   expect_equal(xml_doc$xml_param_vals,xml_doc$sampled_vals)
   expect_equal(xml_doc$measures,c("death-thru-sickness","death-but-immune","death-old-age", "death-old-and-sick"))
   expect_equal(xml_doc$setup,"setup")
   expect_equal(xml_doc$go,"go")
   expect_equal(xml_doc$people,150)

   rm(xml_doc)


   # Remove the created files
   file.remove(file.path(getwd(),"Curve1_infectiousness.csv"))
   file.remove(file.path(getwd(),"Curve2_infectiousness.csv"))
   file.remove(file.path(getwd(),"Curve3_infectiousness.csv"))
   #file.remove(paste(getwd(),"/Curve1_duration.csv",sep=""))
   #file.remove(paste(getwd(),"/Curve2_duration.csv",sep=""))
   #file.remove(paste(getwd(),"/Curve3_duration.csv",sep=""))
   file.remove(file.path(getwd(),"Curve1_dummy.csv"))
   file.remove(file.path(getwd(),"Curve2_dummy.csv"))
   file.remove(file.path(getwd(),"Curve3_dummy.csv"))
   #file.remove(paste(getwd(),"/Curve1_chance-recover.csv",sep=""))
   #file.remove(paste(getwd(),"/Curve2_chance-recover.csv",sep=""))
   #file.remove(paste(getwd(),"/Curve3_chance-recover.csv",sep=""))
   unlink(file.path(getwd(),"1"), recursive = TRUE)
   unlink(file.path(getwd(),"2"), recursive = TRUE)
   unlink(file.path(getwd(),"3"), recursive = TRUE)

})
