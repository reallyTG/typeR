library(testthat)
library(visvow)

filename <- function(options)
{
  options <- gsub("'"     , ""  , options, fixed=TRUE)
  options <- gsub("-"     , "_" , options, fixed=TRUE)
  options <- gsub("&"     , ""  , options, fixed=TRUE)
  options <- gsub(":"     , ""  , options, fixed=TRUE)
  options <- gsub("("     , ""  , options, fixed=TRUE)
  options <- gsub(")"     , ""  , options, fixed=TRUE)
  options <- gsub("  "    , " " , options, fixed=TRUE)
  options <- gsub(" "     , "_" , options, fixed=TRUE)
  options <- gsub("\u00FC", "ue", options, fixed=TRUE)
  
  return(options)
}

# data

vowelTab <- read.table("data/table.csv", header = TRUE, sep = "\t")

# vowelScale

Scales <- c("Hz",
            "bark: Schroeder et al. (1979)",
            "bark: Zwicker & Terhardt (1980)",
            "bark: Traunm\u00FCller (1990)",
            "ERB: Greenwood (1961)",
            "ERB: Moore & Glasberg (1983)",
            "ERB: Glasberg & Moore (1990)",
            "ln",
            "mel: Fant (1968)",
            "mel: O'Shaughnessy (1987)",
            "ST")

for (i in 1:length(Scales))
{
  vowelScale1 <- read.table(paste0("data/",filename(Scales[i]),".csv"), header = TRUE, sep = "\t")
  vowelScale2 <- vowelScale(vowelTab, Scales[i], 50)

  for (j in (1:nrow(vowelScale1)))
  {
    for (k in c(5,6,7,8,10,11,12,13))
    {
      test_that(paste0("Scaling to ",Scales[i]," is performed correctly"),
                expect_equal(vowelScale1[j,k], vowelScale2[j,k], tolerance = 0.000000001, scale = 1)
      )
    }
  }
}

# vowelNormF

replyTimesN <- c("1","2")

vL1 <- vowelLong1(vowelTab,replyTimesN)
vL2 <- vowelLong2(vL1)
vL3 <- vowelLong3(vL1)
vL4 <- vowelLong4(vL1)

NormsF <- c("",
            " Peterson",
            " Sussman",
            " Syrdal & Gopal",
            " Miller",
            " Thomas & Kendall",
            " Gerstman",
            " Lobanov",
            " Watt & Fabricius",
            " Fabricius et al.",
            " Heeringa & Van de Velde",
            " Nearey I",
            " Nearey II",
            " Labov I",
            " Labov II")

for (i in 1:length(NormsF))
{
  fn <- substr(filename(NormsF[i]), 2, nchar(NormsF[i]))
  vowelNorm11 <- read.table(paste0("data/", fn, "F.csv"), header = TRUE, sep = "\t")
  vowelNorm12 <- vowelNormF(vowelTab, vL1, vL2, vL3, vL4, NormsF[i])

  for (j in (1:nrow(vowelNorm11)))
  {
    for (k in c(5,6,7,8,10,11,12,13))
    {
      test_that(paste0(NormsF[i]," is performed correctly"),
                expect_equal(vowelNorm11[j,k], vowelNorm12[j,k], tolerance = 0.000000001, scale = 1)
      )
    }
  }
}

# vowelNormD

NormsD <- c("",
            " Lobanov")

for (i in 1:length(NormsD))
{
  fn <- substr(filename(NormsD[i]), 2, nchar(NormsD[i]))
  vowelNorm21 <- read.table(paste0("data/", fn, "D.csv"), header = TRUE, sep = "\t")
  vowelNorm22 <- vowelNormD(vowelTab, NormsD[i])

  for (j in (1:nrow(vowelNorm21)))
  {
    test_that(paste0(NormsD[i]," is performed correctly"),
              expect_equal(vowelNorm21[j,3], vowelNorm22[j,3], tolerance = 0.000000001, scale = 1)
    )
  }
}
