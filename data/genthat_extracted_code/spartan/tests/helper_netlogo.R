read_created_xml_file <- function(xmlFile, csvFile)
{

  # Now using xml2
  #doc <- read_xml(paste(getwd(),"/1/lhc_analysis_set1.xml", sep=""))
  #all_metrics <- xml_text(xml_find_all(doc, ".//metric"))

  library(XML)

  doc = XML::xmlTreeParse(xmlFile, useInternalNodes = TRUE)
  els = XML::getNodeSet(doc, "/experiments//metric")
  all_metrics <- sapply(els, XML::xmlValue)

  xml_param_vals <- NULL

  # Failed test in August 2018 - this may be linked to XML changes discovered when fixing Johanna's issue with file generation
  # Old test code commented out, need to establish why change was made and whether this fix is correct for Netlogo

  #els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='infectiousness']//value[@value.infectiousness]")
  els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='infectiousness']//value[@value]")
  #sapply(els, function(el) xmlGetAttr(el, "value.infectiousnesss"))
  xml_param_vals <- c(xml_param_vals, xmlAttrs(els[[1]])[[1]])
  #els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='chance-recover']//value[@value.chance-recover]")
  els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='chance-recover']//value[@value]")
  xml_param_vals <- c(xml_param_vals, xmlAttrs(els[[1]])[[1]])
  #els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='duration']//value[@value.duration]")
  els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='duration']//value[@value]")
  xml_param_vals <- c(xml_param_vals, xmlAttrs(els[[1]])[[1]])

  # People is a static value, recover this
  els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='people']//value[@value]")
  people <- as.numeric(xmlAttrs(els[[1]]))

  # Read in the CSV sample file so we can check the values are correct
  sample <- read.csv(csvFile,header=T)

  # Get the set up and go values
  els <- XML::getNodeSet(doc, "/experiments//setup")
  setupVal <- xmlValue(els[[1]])
  els <- XML::getNodeSet(doc, "/experiments//go")
  goVal <- xmlValue(els[[1]])

  return(list("measures"=all_metrics,"xml_param_vals"=as.numeric(xml_param_vals),"sampled_vals"=as.numeric(sample[1,]),"setup"=setupVal,"go"=goVal,"people"=people))
}



read_created_efast_xml_file <- function()
{

  xmlFile <- paste(getwd(),"/1/1/1/efast_analysis_set1.xml",sep="")
  csvFile <- paste(getwd(),"/Curve1_infectiousness.csv",sep="")

  # Now using xml2
  #doc <- read_xml(paste(getwd(),"/1/lhc_analysis_set1.xml", sep=""))
  #all_metrics <- xml_text(xml_find_all(doc, ".//metric"))

  #library(XML)

  doc = XML::xmlTreeParse(xmlFile, useInternalNodes = TRUE)
  els = XML::getNodeSet(doc, "/experiments//metric")
  all_metrics <- sapply(els, XML::xmlValue)

  xml_param_vals <- NULL
  els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='people']//value[@value]")
  xml_param_vals <- c(xml_param_vals, xmlAttrs(els[[1]])[[1]])
  els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='infectiousness']//value[@value]")
  xml_param_vals <- c(xml_param_vals, xmlAttrs(els[[1]])[[1]])
  #els = getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='chance-recover']//value[@value]")
  #xml_param_vals <- c(xml_param_vals, xmlAttrs(els[[1]])[[1]])
  #els = getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='duration']//value[@value]")
  #xml_param_vals <- c(xml_param_vals, xmlAttrs(els[[1]])[[1]])
  els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='dummy']//value[@value]")
  xml_param_vals <- c(xml_param_vals, xmlAttrs(els[[1]])[[1]])

  # People is a static value, recover this
  els = XML::getNodeSet(doc, "/experiments//enumeratedValueSet[@variable='people']//value[@value]")
  people <- as.numeric(xmlAttrs(els[[1]]))

  # Read in the CSV sample file so we can check the values are correct
  sample <- read.csv(csvFile,header=T, check.names = FALSE)
  # Add the people value to this, so the comparison between sample and XML content is the same
  sample<-c(as.numeric(people),as.numeric(sample[1,]))

  # Get the set up and go values
  els <- XML::getNodeSet(doc, "/experiments//setup")
  setupVal <- XML::xmlValue(els[[1]])
  els <- XML::getNodeSet(doc, "/experiments//go")
  goVal <- XML::xmlValue(els[[1]])

  rm(doc)

  #print(paste("xml_param_vals ", as.numeric(xml_param_vals)))
  #print(paste("sampled_vals ", as.numeric(sample[1,])))
  return(list("measures"=all_metrics,"xml_param_vals"=as.numeric(xml_param_vals),"sampled_vals"=sample,"setup"=setupVal,"go"=goVal,"people"=people))
}
