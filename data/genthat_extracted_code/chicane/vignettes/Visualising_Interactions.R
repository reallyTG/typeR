## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dpi = 150,
  fig.width = 5,
  fig.height = 5,
  cache = TRUE,
  eval = TRUE
    );

## ---- cache = TRUE-------------------------------------------------------
library(chicane);
data(bre80);

options(ucscChromosomeNames = FALSE);

bre80.interactions <- chicane(interactions = bre80);


## ---- message = FALSE----------------------------------------------------
library(GenomicInteractions);
library(Gviz);

options(ucscChromosomeNames = FALSE);

locus <- list(chr = 'chr2', start = 217035649, end = 217042355);
locus.id <- paste0(locus$chr, ':', locus$start, '-', locus$end);

ideogram.track <- IdeogramTrack(genome = 'hg38', chromosome = locus$chr);
genome.axis.track <- GenomeAxisTrack();

# get counts and interactions involving specific locus
# TO DO: need to switch this to generic other end in case of b2b
# add note about p-value/ q-value
locus.counts <- bre80[ target.id == locus.id | bait.id == locus.id ];
locus.interactions <- bre80.interactions[ p.value < 0.001 & (target.id == locus.id | bait.id == locus.id) ];


# create track for visualising read count
interaction.count.track <- DataTrack(
    range = GRanges(locus.counts$target.id),
    data = locus.counts$count,
    name = 'Reads'
    );

# create track for visualising significant interactions
interaction.object <- GenomicInteractions(
	anchor1 = GRanges( locus.interactions$bait.id ),
	anchor2 = GRanges( locus.interactions$target.id ),
	count = -log10(locus.interactions$p.value)
    );

interaction.track <- InteractionTrack(
    interaction.object,
    name = 'Chicane'
    );

gene.track <- GeneRegionTrack(
    system.file( 'extdata', 'gencode_2q35.gtf', package = 'chicane' ),
    chr = locus$chr,
    start = locus$start - 1e6,
    end = locus$end + 1e6,
    stacking = 'squish',
    stackHeight = 0.3,
    name = 'Genes'
    );

# plot
plotTracks(
    list(
        ideogram.track, 
        genome.axis.track, 
        gene.track,
        interaction.count.track,
        interaction.track
        ),
    sizes = c(0.4, 1, 1, 4, 3),
    type = 'histogram',
    transcriptAnnotation = 'symbol',
    collapseTranscripts = 'longest',
    col = NULL,
    from = locus$start - 1e6,
    to = locus$end + 1e6
    );

## ---- fig.height = 3-----------------------------------------------------
baits <- read.bed( system.file( 'extdata', '2q35.bed', package = 'chicane' ) );


sig.interactions <- bre80.interactions[ (bait.id %in% baits | target.id %in% baits) & p.value < 0.001 ];

# show baits
bait.track <- AnnotationTrack( GRanges(baits), name = 'Baits', fill = 'black');


read.tracks <- lapply(
    baits,
    function(bait, bre80, baits) {
        bait.counts <- bre80[ bait.id == bait & !(target.id %in% baits) ];

        bait.chr <- bait.counts$bait.chr[1];

        read.track <- DataTrack(
            range = GRanges(bait.counts$target.id),
            data = bait.counts$count,
            name = ' ', # empty string causes plotting to fail...
            chromosome = bait.chr,
            fill.histogram = 'darkgrey',
            col.histogram = 'darkgrey',
            cex.axis = 0
            );
        
        return(read.track);
    },
    bre80 = bre80,
    baits = baits
    );

# create track for visualising significant interactions
interaction.object <- GenomicInteractions(
	anchor1 = GRanges( sig.interactions$bait.id ),
	anchor2 = GRanges( sig.interactions$target.id ),
	count = -log10(sig.interactions$p.value)
    );

interaction.track <- InteractionTrack(
    interaction.object,
    name = 'Chicane'
    );

gene.track <- GeneRegionTrack(
    system.file( 'extdata', 'gencode_2q35.gtf', package = 'chicane' ),
    chr = locus$chr,
    start = 216100000,
    end = 217900000,
    stacking = 'squish',
    stackHeight = 0.3,
    name = 'Genes'
    );

plotTracks(
    c(
        list(
            ideogram.track, 
            genome.axis.track
        ),
        read.tracks,
        list(
            interaction.track,
            bait.track,
            gene.track
            )
        ),
    sizes = c(0.4, 1, rep(0.2, length(read.tracks)), 2, 0.5, 1),
    # sizes = c(0.4, 1, 1, 0.5, 1),
    transcriptAnnotation = 'symbol',
    collapseTranscripts = 'longest',
    type = 'hist',
    col = NULL,
    from = 216100000,
    to = 217900000
    );

