## ------------------------------------------------------------------------
set.seed(12345)
n <- 6
s <- function(x) sample(x, n, replace = TRUE)

incadata <- 
    data.frame(KON_VALUE = s(1:2),
               region = 1:6,
               a_icdo3 = c("C446", "C749", "C159", "C709", "C475", "C320"),
               a_tstad = c("0", "1", "1a", "1b", "1c", "2")
)
knitr::kable(incadata)


## ------------------------------------------------------------------------

# the package is automatically attached by the rcc package.
# Use 'library(rcc)' if you have the rcc package installed or
# attach only the decoder package by:
library(decoder)

decode(incadata$KON_VALUE, "kon")
decode(incadata$a_tstad, "t_rtr")

## ------------------------------------------------------------------------
incadata_decoded <- decode(incadata)
knitr::kable(incadata_decoded)

## ------------------------------------------------------------------------
decode(incadata$a_icdo3, "icd10")

## ------------------------------------------------------------------------
decode(c("D448A", "T009", "F182", "S134C", "C131"), "icd10")

## ------------------------------------------------------------------------
x <- c(178405, 138408, 108202, 128706, 048005)
y <- as.numeric(substring(as.character(x), 1, 4))
decode(y, "kommun", exact = TRUE)

## ------------------------------------------------------------------------
decode(x, "kommun")

## ------------------------------------------------------------------------
decode("048005", "kommun")

## ------------------------------------------------------------------------
df <- 
  data.frame(
    LKF = c("149804", "147104", "012704", "143505", "126502", "232602")
  )
knitr::kable(suppressWarnings(decode(df)))

## ------------------------------------------------------------------------
decode(1:6, "region")

## ------------------------------------------------------------------------
decode(1:6, "region", "short_region_names")

## ------------------------------------------------------------------------
munic_west <- c("1382", "1419", "1441", "1460", "1472", "1488", "1496")
decode(munic_west, "sjukvardsomrade", c("kungalv2Storgoteborg", "real_names"))

## ------------------------------------------------------------------------
code(c("Karlskrona", "Göteborg", "Härnösand"), "kommun")

## ------------------------------------------------------------------------
non_unique <- c(90703, 90723, 96153, 99403, 89643, 90443)
decode(non_unique, "snomed")

## ------------------------------------------------------------------------
unique <- c(
  "Mucinöst kystadenom (kystom) borderline-typ ( 2 B)", 
  "Medullärt carcinom, atypiskt", 
  "Mb Paget non invasiv och intraduktal", 
  "Lymfangiosarcom, misst", 
  "Fibröst histiocytom, malignt", 
  "Ganglioneurom", 
  "Carcinoid (exkl appendix)", 
  "Langerhans cell histiocytos, UNS, Histiocytosis X, UNS", 
  "Brenner tumör, malign", 
  "Lymfatisk leukemi, UNS")
code(unique, "snomed")

## ------------------------------------------------------------------------
decoder:::kon
decoder:::region

## ------------------------------------------------------------------------
attributes(decoder:::kon)

## ------------------------------------------------------------------------
knitr::kable(head(decoder:::ALL_STANDARD_VAR_NAMES))

## ------------------------------------------------------------------------
(kv <- as.keyvalue(c("car" = 1, "bike" = 2, "bus" = 3)))
x <- s(1:3)
decode(x, kv)

## ------------------------------------------------------------------------
ex <- list(
         fruit  = c("banana", "orange", "kiwi"),
         car    = c("SAAB", "Volvo", "taxi", "truck"),
         animal = c("elephant")
)
knitr::kable(as.keyvalue(ex))

