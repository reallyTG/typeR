## ----install_github, eval=FALSE------------------------------------------
#  library(devtools)
#  install_github("kamapu/taxlist", build_vignettes=TRUE)

## ----install_cran, eval=FALSE--------------------------------------------
#  install.packages("taxlist", dependencies=TRUE)

## ----load_taxlist, message=FALSE-----------------------------------------
library(taxlist)

## ----call_vignette, eval=FALSE-------------------------------------------
#  vignette("taxlist-intro")

## ----load_example_table--------------------------------------------------
load(url("https://github.com/kamapu/thisdataismine/raw/master/data/Cross.rda"))

## ----head_example--------------------------------------------------------
head(Cross[,1:8])

## ----character2taxlist---------------------------------------------------
Splist <- Cross[,"TaxonName"]
Splist <- df2taxlist(Splist)
summary(Splist)

## ----summary_character---------------------------------------------------
summary(Splist, "Erigeron floribundus")

## ----resolving_nomenclature, message=FALSE-------------------------------
summary(Splist)
Splist <- taxlist::tnrs(Splist)
summary(Splist)

## ----summary_all---------------------------------------------------------
summary(Splist, "Erigeron floribundus")

## ------------------------------------------------------------------------
accepted_name(Splist)[1:5,]

## ----load_easplist-------------------------------------------------------
data(Easplist)
summary(Easplist)

## ----summary_life_forms--------------------------------------------------
summary(as.factor(Easplist$LifeForm))

## ----papyrus_otp1, results="hide"----------------------------------------
Papyrus <- subset(Easplist, grepl("papyrus", TaxonName), slot="names")
summary(Papyrus, "all")

## ----papyrus_opt2, results="hide"----------------------------------------
Papyrus <- subset(Easplist, TaxonConceptID == 206, slot="relations")
summary(Papyrus, "all")

## ----phragmites, results="hide"------------------------------------------
Phraaus <- subset(Easplist, charmatch("Phragmites australis", TaxonName),
	slot="names")
summary(Phraaus, "all")

## ----summary_again-------------------------------------------------------
summary(Easplist)

## ----recover_parents-----------------------------------------------------
summary(Papyrus, "all")
Papyrus <- get_parents(Easplist, Papyrus)
summary(Papyrus, "all")

## ----load_syntax---------------------------------------------------------
load(url("https://github.com/kamapu/Guides/raw/master/data/wetlands_syntax.rda"))

## ----prototype-----------------------------------------------------------
head(Concepts)

Syntax <- new("taxlist")

levels(Syntax) <- c("association","alliance","order","class")

taxon_views(Syntax) <- data.frame(ViewID=1, Secundum="Alvarez (2017)",
		Author="Alvarez M", Year=2017,
        Title="Classification of aquatic and semi-aquatic vegetation in East Africa",
        stringsAsFactors=FALSE)

Syntax <- with(Concepts, add_concept(Syntax, TaxonName=TaxonName,
                AuthorName=AuthorName, Parent=Parent, Level=Level,
                ViewID=rep(1, nrow(Concepts))))

summary(Syntax)

## ----adding_synonyms-----------------------------------------------------
head(Synonyms)
Syntax <- with(Synonyms, add_synonym(Syntax, ConceptID=TaxonConceptID,
                TaxonName=TaxonName, AuthorName=AuthorName))

## ----adding_traits-------------------------------------------------------
head(Codes)
taxon_traits(Syntax) <- Codes
summary(Syntax)

## ----get_nymplot---------------------------------------------------------
Nymplot <- subset(Syntax, charmatch("Nymphaeetum", TaxonName), slot="names")
summary(Nymplot, "all")

## ----get_nymplot_2-------------------------------------------------------
Nymplot <- subset(Syntax, charmatch("Nymphaeetum", TaxonName), slot="names",
	keep_parents=TRUE)
summary(Nymplot, "all")

