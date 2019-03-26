library(genetics)


### Name: order.genotype
### Title: Order/sort genotype/haplotype object
### Aliases: order order.genotype sort.genotype genotypeOrder
###   genotypeOrder<-
### Keywords: manip misc

### ** Examples

  x <- c("C/C", "A/C", "A/A", NA, "C/B", "B/A", "B/B", "B/C", "A/C")
  alleles <- c("A", "B", "C")

  g <- genotype(x, alleles=alleles, reorder="yes")
  ## "C/C" "A/C" "A/A" NA    "B/C" "A/B" "B/B" "B/C" "A/C"

  h <- haplotype(x, alleles=alleles)
  ## "C/C" "A/C" "A/A" NA    "C/B" "B/A" "B/B" "B/C" "A/C"

  ## --- Standard usage ---

  sort(g)
  ## "A/A" "A/B" "A/C" "A/C" "B/B" "B/C" "B/C" "C/C" NA

  sort(h)
  ## "A/A" "A/C" "A/C" "B/A" "B/B" "B/C" "C/B" "C/C" NA

  ## --- Reversed order of alleles ---

  sort(g, alleleOrder=c("B", "C", "A"))
  ## "B/B" "B/C" "B/C" "A/B" "C/C" "A/C" "A/C" "A/A" NA
  ## note that A/B comes after B/C since it is treated as B/A;
  ## order of alleles (not in alleleOrder!) does not matter for a genotype

  sort(h, alleleOrder=c("B", "C", "A"))
  ## "B/B" "B/C" "B/A" "C/B" "C/C" "A/C" "A/C" "A/A" NA

  ## --- Missing allele(s) in alleleOrder ---

  sort(g, alleleOrder=c("B", "C"))
  ## "B/B" "B/C" "B/C" "C/C" "A/C" "A/A" NA    "A/B" "A/C"

  sort(g, alleleOrder=c("B"))
  ## "B/B" "C/C" "A/C" "A/A" NA    "B/C" "A/B" "B/C" "A/C"
  ## genotypes with missing allele are treated as NA

  sort(h, alleleOrder=c("B", "C"))
  ## "B/B" "B/C" "C/B" "C/C" "A/C" "A/A" NA    "B/A" "A/C"

  sort(h, alleleOrder=c("B"))
  ## "B/B" "C/C" "A/C" "A/A" NA    "C/B" "B/A" "B/C" "A/C"

  ## --- Use of genotypeOrder ---

  sort(g, genotypeOrder=c("A/A", "C/C", "B/B", "A/B", "A/C", "B/C"))
  ## "A/A" "C/C" "B/B" "A/B" "A/C" "A/C" "B/C" "B/C" NA

  sort(h, genotypeOrder=c("A/A", "C/C", "B/B",
                          "A/C", "C/B", "B/A", "B/C"))
  ## "A/A" "C/C" "B/B" "A/C" "A/C" "C/B" "B/A" "B/C" NA

  ## --- Missing genotype(s) in genotypeOrder ---

  sort(g, genotypeOrder=c(       "C/C",        "A/B", "A/C", "B/C"))
  ## "C/C" "A/B" "A/C" "A/C" "B/C" "B/C" "A/A" NA    "B/B"

  sort(h, genotypeOrder=c(       "C/C",        "A/B", "A/C", "B/C"))
  ## "C/C" "A/C" "A/C" "B/C" "A/A" NA    "C/B" "B/A" "B/B"



