## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  cache = TRUE,
  eval = TRUE
  );


## ---- warning = FALSE----------------------------------------------------
library(chicane);

# example BAM file, baits, and restriction fragments
bam <- system.file('extdata', 'Bre80_2q35.bam', package = 'chicane');
baits <- system.file('extdata', '2q35.bed', package = 'chicane');
fragments <- system.file('extdata', 'GRCh38_HindIII_chr2.bed.gz', package = 'chicane'); # HindIII fragments on chromosome 2

if( bedtools.installed() ) {
  chicane.results <- chicane(
    bam = bam,
    baits = baits,
    fragments = fragments
    );

    print( chicane.results[ 1:10 ] );
}


## ---- warning = FALSE----------------------------------------------------
if( bedtools.installed() ) {
  interaction.data <- prepare.data(
    bam = bam,
    baits = baits,
    fragments = fragments
    );
}

## ------------------------------------------------------------------------
if( bedtools.installed() ) print(interaction.data);

## ------------------------------------------------------------------------
if( bedtools.installed() ) {
  cis.zero.results <- chicane(
    bam = bam,
    baits = baits,
    fragments = fragments,
    include.zeros = 'cis'
    ); 

    print( cis.zero.results[ 1:10 ] );
}

## ---- warning = FALSE, run = FALSE---------------------------------------
if( bedtools.installed() ) {
  file.name <- tempfile('interaction_data');
  write.table(interaction.data, file.name, row.names = FALSE);

  chicane.results <- chicane(interactions = file.name); 
}

## ------------------------------------------------------------------------
data(bre80);
adjusted.results <- chicane(
  interactions = bre80, 
  adjustment.terms = 'target.chr'
  );

print( adjusted.results[ 1:5 ] );

## ------------------------------------------------------------------------
sessionInfo();

