.jinit(Sys.glob("../../inst/java/*.jar"))

# --------- #
# TEST DATA #
# --------- #

getFile <- function(file){
  normalizePath(system.file("extdata", file, package = "corehunter"))
}

testData <- function(){
  coreHunterData(
    distances = distanceData(),
    genotypes = genotypeData(),
    phenotypes = phenotypeData()
  )
}
distanceData <- function(size = c("default", "small")){
  size <- match.arg(size)
  if(size == "small"){
    distances(file = "data/distances-small.txt")
  } else {
    distances(file = distanceFile())
  }
}
genotypeData <- function(size = c("default", "small"), format = c("default", "biparental", "frequency")){
  size <- match.arg(size)
  format <- match.arg(format)
  genotypes(file = genotypeFile(size, format), format = format)
}
phenotypeData <- function(size = c("default", "small")){
  size <- match.arg(size)
  if(size == "small"){
    phenotypes(file = "data/phenotypes-small.csv")
  } else {
    phenotypes(file = phenotypeFile())
  }
}

distanceFile <- function(){
  getFile("distances.csv")
}

genotypeFile <- function(size = c("default", "small"), format = c("default", "biparental", "frequency")){
  size <- match.arg(size)
  format <- match.arg(format)
  if(size == "default"){
    file <- getFile(switch(format,
      "default" = "genotypes.csv",
      "biparental" = "genotypes-biparental.csv",
      "frequency" = "genotypes-frequency.csv"
    ))
  } else {
    file <- switch(format,
     "default" = "data/genotypes-small.csv",
     "biparental" = "data/genotypes-bi-small.csv",
     "frequency" = "data/genotypes-freq-small.csv"
    )
  }
  return(file)
}

phenotypeFile <- function(){
  getFile("phenotypes.csv")
}

getIds <- function(size = c("default", "small")){
  size <- match.arg(size)
  if(size == "default"){
    ids <- as.character(1:218)
  } else {
    ids <- c("Alice", "Dave", "Bob", "Bob'", "Carol")
  }
  return(ids)
}

getNames <- function(size = c("default", "small")){
  size <- match.arg(size)
  if(size == "default"){
    names <- c("Bred_0003", "Bred_0004", "Bred_0005", "Bred_0006", "Bred_0013",
               "Bred_0014", "Bred_0016", "Bred_0017", "Bred_0021", "Bred_0022",
               "Bred_0023", "Bred_0024", "Bred_0026", "Bred_0027", "Bred_0028",
               "Bred_0030", "Bred_0031", "Bred_0033", "Bred_0036", "Bred_0038",
               "Bred_0039", "Bred_0046", "Bred_0047", "Bred_0048", "Bred_0049",
               "Bred_0052", "Bred_0053", "Bred_0055", "Bred_0057", "Bred_0058",
               "Bred_0059", "Bred_0063", "Bred_0064", "Bred_0066", "Bred_0068",
               "Bred_0069", "Bred_0071", "Bred_0072", "Bred_0074", "Bred_0082",
               "Bred_0083", "Bred_0085", "Bred_0086", "Bred_0089", "Bred_0094",
               "Bred_0095", "Bred_0099", "Bred_0101", "Bred_0103", "Bred_0106",
               "Bred_0107", "Bred_0108", "Bred_0109", "Bred_0110", "Bred_0112",
               "Bred_0114", "Bred_0115", "Bred_0116", "Bred_0117", "Bred_0118",
               "Bred_0119", "Bred_0120", "Bred_0121", "Bred_0123", "Bred_0125",
               "Bred_0126", "Bred_0129", "Bred_0130", "Bred_0131", "Bred_0132",
               "Bred_0133", "Bred_0137", "Bred_0138", "Bred_0141", "Bred_0144",
               "Bred_0146", "Bred_0148", "Bred_0149", "Bred_0152", "Bred_0159",
               "Bred_0162", "Bred_0165", "Bred_0169", "Bred_0170", "Bred_0171",
               "Bred_0173", "Bred_0175", "Bred_0177", "Bred_0178", "Bred_0179",
               "Bred_0180", "Bred_0185", "Bred_0187", "Bred_0188", "Bred_0191",
               "Bred_0193", "Bred_0196", "Bred_0197", "Bred_0198", "Bred_0199",
               "Bred_0200", "Bred_0212", "Bred_0213", "Bred_0215", "Bred_0219",
               "Bred_0220", "Bred_0222", "Bred_0224", "Bred_0225", "Bred_0227",
               "Bred_0228", "Bred_0240", "Bred_0242", "Bred_0245", "Bred_0249",
               "Bred_0250", "Bred_0252", "Bred_0254", "Bred_0255", "Bred_0256",
               "Bred_0259", "Bred_0261", "Bred_0262", "Bred_0266", "Bred_0267",
               "Bred_0268", "Bred_0269", "Bred_0270", "Bred_0271", "Bred_0273",
               "Bred_0280", "Bred_0281", "Bred_0283", "Bred_0284", "Bred_0285",
               "Bred_0286", "Bred_0287", "Bred_0292", "Bred_0295", "Bred_0296",
               "Bred_0297", "Bred_0298", "Bred_0299", "Bred_0300", "Bred_0301",
               "Bred_0302", "Bred_0303", "Bred_0304", "Bred_0305", "Bred_0306",
               "Bred_0307", "Bred_0309", "Bred_0310", "Bred_0311", "Bred_0312",
               "Bred_0313", "Bred_0315", "Bred_0316", "Bred_0318", "Bred_0319",
               "Bred_0326", "Bred_0327", "Bred_0329", "Bred_0330", "Bred_0331",
               "Bred_0335", "Bred_0336", "Bred_0339", "Bred_0342", "Bred_0343",
               "Bred_0344", "Bred_0347", "Bred_0349", "Bred_0354", "Bred_0355",
               "Bred_0357", "Bred_0359", "Bred_0360", "Bred_0362", "Bred_0365",
               "Bred_0367", "Bred_0368", "Bred_0369", "Bred_0370", "Bred_0371",
               "Bred_0372", "Bred_0373", "Bred_0374", "Bred_0378", "Bred_0379",
               "Bred_0381", "Bred_0382", "Bred_0387", "Bred_0389", "Bred_0390",
               "Bred_0392", "Bred_0393", "Bred_0394", "Bred_0396", "Bred_0398",
               "Bred_0399", "Bred_0400", "Bred_0405", "Bred_0406", "Bred_0408",
               "Bred_0409", "Bred_0412", "Bred_0417", "Bred_0418", "Bred_0419",
               "Bred_0420", "Bred_0421", "Bred_0422", "Bred_0425", "Bred_0426",
               "Bred_0429", "Bred_0433", "Bred_0434")
  } else {
    names <- c("Alice", "Dave", "Bob", "Bob", "Carol")
  }
  return(names)
}

getMarkerNames <- function(size = c("default", "small")){
  size <- match.arg(size)
  if(size == "default"){
    names <- paste("M", 1:190, sep = "")
  } else {
    names <- c("mk1", "mk,2", "mk'3", "mk4")
  }
  return(names)
}

getRanges <- function(size = c("default", "small")){
  size <- match.arg(size)
  if(size == "default"){
    ranges <- c(9.6254, 86.1488316, 49.7700584, 8.2565)
  } else {
    ranges <- c(NA, NA, 10, 2.0, NA)
  }
  return(ranges)
}

# ----------------- #
# UTILITY FUNCTIONS #
# ----------------- #

testSampleCore <- function(...){
  sampleCore(..., mode = "f", time = 1)
}
