## ------------------------------------------------------------------------
library(readr)
library(dplyr)
library(tidyr)
library(magrittr)
set.seed(210)

good_gfffile <- system.file('extdata', 'gff', '0.gff3', package='rmonad')

read_gff <- function(file){
  readr::read_tsv(
    file,
    col_names = c(
        "seqid",
        "source",
        "type",
        "start",
        "stop",
        "score",
        "strand",
        "phase",
        "attr"
    ),
    na        = ".",
    comment   = "#",
    col_types = "ccciidcic"
  )
}

read_gff(good_gfffile)

## ------------------------------------------------------------------------
# wrong type
bad0 <- system.file('extdata', 'gff', 'bad-0.gff3', package='rmonad')
read_gff(bad0)

## ------------------------------------------------------------------------
# wrong column number
bad1 <- system.file('extdata', 'gff', 'bad-1.gff3', package='rmonad')
read_gff(bad1)

## ------------------------------------------------------------------------
g <- read_gff(good_gfffile)
for(col in c("seqid", "type", "start", "stop")){
  if(any(is.na(g[[col]]))){
    stop("GFFError: Column '", col, "' may not have missing values")
  }
}

## ------------------------------------------------------------------------
gene_synonyms <- 'SO:0000704'
mRNA_synonyms <- c('messenger_RNA', 'messenger RNA', 'SO:0000234')
CDS_synonyms  <- c('coding_sequence', 'coding sequence', 'SO:0000316')
exon_synonyms <- 'SO:0000147'

g$type <- ifelse(g$type %in% gene_synonyms, 'gene', g$type)
g$type <- ifelse(g$type %in% mRNA_synonyms, 'mRNA', g$type)
g$type <- ifelse(g$type %in% CDS_synonyms,  'CDS',  g$type)
g$type <- ifelse(g$type %in% exon_synonyms, 'exon', g$type)

mRNA_near_synonyms <- c('transcript', 'SO:0000673')
exon_near_synonyms <- c('SO:0000147', 'coding_exon', 'coding exon', 'SO:0000195')

if(any(g$type %in% mRNA_near_synonyms)){
    g$type <- ifelse(g$type %in% mRNA_near_synonyms, 'mRNA', g$type)
    warning("Substituting transcript types for mRNA types, this is probably OK")
}

if(any(g$type %in% exon_near_synonyms)){
    g$type <- ifelse(g$type %in% exon_near_synonyms, 'exon', g$type)
    warning("Substituting transcript types for exon types, this is probably OK")
}

## ------------------------------------------------------------------------

tags <- c("ID", "Parent")

data_frame(
    attr  = stringr::str_split(g$attr, ";"),
    order = 1:nrow(g)
  ) %>%
  dplyr::mutate(ntags = sapply(attr, length)) %>%
  tidyr::unnest(attr) %>%
  dplyr::mutate(attr = ifelse(grepl('=', attr), attr, paste(".U", attr, sep="="))) %>%
  tidyr::separate_(
    col   = "attr",
    into  = c("tag", "value"),
    sep   = "=",
    extra = "merge"
  ) %>%
  dplyr::filter(tag %in% c(tags, ".U")) %>%
  {
    if(nrow(.) > 0){
      tidyr::spread(., key="tag", value="value")
    } else {
      .$tag   = NULL
      .$value = NULL
      .
    }
  } %>%
  {
    if("Parent" %in% names(.)){
      .$Parent <- ifelse(.$Parent == "-", NA, .$Parent)
    }
    .
  } %>% {
    for(tag in c(tags, ".U")){
      if(! tag %in% names(.))
        .[[tag]] = NA_character_
    }
    .
  } %>%
  {
    if("ID" %in% names(.))
      .$ID <- ifelse(is.na(.$ID) & !is.na(.$.U) & .$ntags == 1, .$.U, .$ID)
    .
  } %>%
  merge(data_frame(order=1:nrow(g)), all=TRUE) %>%
  dplyr::arrange(order) %>%
  { cbind(g, .) } %>%
  dplyr::select(-.U, -order, -ntags, -attr) %>%
  {
    if(all(c("ID", "Parent") %in% names(.))){
      parents <- subset(., type %in% c("CDS", "exon"))$Parent
      parent_types <- subset(., ID %in% parents)$type

      if(any(parent_types == "gene"))
        warning("Found CDS or exon directly inheriting from a gene, this may be fine.") 

      if(! all(parent_types %in% c("gene", "mRNA")))
        stop("Found CDS or exon with illegal parent")

      if( any(is.na(parents)) )
        stop("Found CDS or exon with no parent")

      if(! any(duplicated(.$ID, incomparables=NA)))
        warning("IDs are not unique, this is probably bad")
    }
    .
  }


## ------------------------------------------------------------------------
require(readr)
require(dplyr)
require(tidyr)
require(magrittr)
library(rmonad)
set.seed(210)

#' @param file The input GFF file
#' @param tags The GFF tags to keep
#'        default these are not stored)
read_gff <- function(file, tags){

  "
  This function reads a GFF. It builds a data frame from it that with a column
  for each value in `tags`.

  The `read_gff` function is a nested function, containing an Rmonad pipeline
  inside it. This docstring describes the entire wrapped pipeline.
  "

  raw_gff <- as_monad(
    {

      "
      Rmonad supports docstrings. If a block begins with a string, this
      string is extracted and stored. Python has something similar, where the
      first string in a function is cast as documentation.
      
      The `as_monad` function takes an expression and wraps its result into a
      context. It also handles the extraction of this docstring. The result
      here is used at more than one place in the pipeline. Rather than
      accessing it later as a global, it will be funneled bach in.
      "

      readr::read_tsv(
        file,
        col_names = c(
          "seqid",
          "source",
          "type",
          "start",
          "stop",
          "score",
          "strand",
          "phase",
          "attr"
        ),
        na        = ".",
        comment   = "#",
        col_types = "ccciidcic"
      )
    }
  )

  raw_gff %>% tag('raw_gff') %>>% {

    "
    The %>>% operator applies the function described in this block to the
    input on the left-hand-side. This corresponds to the UNIX '|' or magrittr's
    '%>%'. It differs from them in that it is a monadic bind operator, rather
    than an application operator. It carries a context along with the
    computations. The context can store past values, performance information,
    this docstring, and links to the parent chunk. The context is a directed
    graph of code chunks and their metadata.

    Here I assert that no data is missing in the columns where it is required.
    "

    for(col in c("seqid", "type", "start", "stop")){
      if(any(is.na(.[[col]]))){
        stop("GFFError: Column '", col, "' may not have missing values")
      }
    }
    .
  } %>>% {

    "
    According the GFF specification, the value in the type column should be
    from the Sequence Ontology (SO). Here I collapse the synonymous terms
    for the main features usually present in GFF file (gene, mRNA, CDS, and
    exon). In production code, I would probably do something a bit more formal. 
    "

    gene_synonyms <- 'SO:0000704'
    mRNA_synonyms <- c('messenger_RNA', 'messenger RNA', 'SO:0000234')
    CDS_synonyms  <- c('coding_sequence', 'coding sequence', 'SO:0000316')
    exon_synonyms <- 'SO:0000147'

    .$type <- ifelse(.$type %in% gene_synonyms, 'gene', .$type)
    .$type <- ifelse(.$type %in% mRNA_synonyms, 'mRNA', .$type)
    .$type <- ifelse(.$type %in% CDS_synonyms,  'CDS',  .$type)
    .$type <- ifelse(.$type %in% exon_synonyms, 'exon', .$type)

    .
  } %>_% {

    "
    The %>_% operator lets this chunk of code be run for its effects, which are
    raising warnings if we replace the type with a questionable synonym.  We
    could alternatively just use %>>% and add a terminal '.' to this chunk.
    However, the `%>_%` operator guarantees the input is passed without being
    changed, which is safer and also clarifies our intention. 
    "

    mRNA_near_synonyms <- c('transcript', 'SO:0000673')
    exon_near_synonyms <- c('SO:0000147', 'coding_exon', 'coding exon', 'SO:0000195')

    if(any(.$type %in% mRNA_near_synonyms)){
        .$type <- ifelse(.$type %in% mRNA_near_synonyms, 'mRNA', .$type)
        warning("Substituting transcript types for mRNA types, this is probably OK")
    }

    if(any(.$type %in% exon_near_synonyms)){
        .$type <- ifelse(.$type %in% exon_near_synonyms, 'exon', .$type)
        warning("Substituting transcript types for exon types, this is probably OK")
    }

  } %>>% {

    "
    Notice below that I use the magrittr operator '%>%' inside the rmonad
    pipeline. When to pipe with rmonad and when to pipe with magrittr is a
    matter of granularity. This chunk of code perhaps should form one
    documentation unit. And perhaps I don't expect it to fail. If I break this
    chunk into several, the failures are more localized, and I can access
    intermediate values for debugging. On the other hand, putting every little
    operation in a new chunk will clutter the graph and reports derived from
    it.
    "

    data_frame(
      attr  = stringr::str_split(.$attr, ";"),
      order = 1:nrow(.)
    ) %>%
      dplyr::mutate(ntags = sapply(attr, length)) %>%
      tidyr::unnest(attr) %>%
      dplyr::mutate(attr = ifelse(grepl('=', attr), attr, paste(".U", attr, sep="="))) %>%
      tidyr::separate_(
        col   = "attr",
        into  = c("tag", "value"),
        sep   = "=",
        extra = "merge"
      )

   } %>% funnel(raw_gff=raw_gff, tags=tags) %*>% {

    "
    The %v>% operator stores the input value in memory. We could replace every
    %>>% operator with %v>%. This would let us inspect every step of an
    analysis at the cost of high memory usage. For brevity, I won't break this
    following block down any further.

    The `funnel` function packages a list in a monad, merging their histories
    and propagating error. That is, if `gff` or `tags` failed upstream, this
    function will not be run. `%*>%` takes a list on the left and feeds it into
    the function on the right as an argument list. Here `funnel` and `%*>%` are
    used together to merge a pipeline (gff) and inject a parameter (tags).

    We could not have written

      %v>% function(gff=gff, tags=tags)

    because this would have brought the monad wrapped gff into scope, not the
    value itself.
    "

      dplyr::filter(., tag %in% c(tags, ".U")) %>%
      {
        if(nrow(.) > 0){
          tidyr::spread(., key="tag", value="value")
        } else {
          .$tag   = NULL
          .$value = NULL
          .
        }
      } %>%
      {
        if("Parent" %in% names(.)){
          .$Parent <- ifelse(.$Parent == "-", NA, .$Parent)
        }
        .
      } %>% {
        for(tag in c(tags, ".U")){
          if(! tag %in% names(.))
            .[[tag]] = NA_character_
        }
        .
      } %>%
      {
        if("ID" %in% names(.))
          .$ID <- ifelse(is.na(.$ID) & !is.na(.$.U) & .$ntags == 1, .$.U, .$ID)
        .
      } %>%
      merge(data_frame(order=1:nrow(raw_gff)), all=TRUE) %>%
      dplyr::arrange(order) %>%
      { cbind(raw_gff, .) } %>%
      dplyr::select(-.U, -order, -ntags, -attr)

  } %>_% {

    "
    And make the last few assertions.
    "

    if(all(c("ID", "Parent") %in% names(.))){
      parents <- subset(., type %in% c("CDS", "exon"))$Parent
      parent_types <- subset(., ID %in% parents)$type

      if(any(parent_types == "gene"))
        warning("Found CDS or exon directly inheriting from a gene, this may be fine.")

      if(! all(parent_types %in% c("gene", "mRNA")))
        stop("Found CDS or exon with illegal parent")

      if(any(is.na(parents)) )
        stop("Found CDS or exon with no parent")

      if(any(duplicated(.$ID, incomparables=NA)))
        warning("IDs are not unique, this is probably bad")
    }

  } %>_% {

    "
    I could post some closing comments here. The %>_% operator can be chained
    and the output does not affect the output of the main chain. The NULL is
    required to distinguish this block from an anonymous function that returns
    a string.
    "

    NULL
  }
  # End Rmonad chain

}

gff_as_graph <- function(file){
  read_gff(file, tags=c("ID", "Parent")) %>>%
  dplyr::filter(!is.na(Parent)) %>>%
  {
      "Make a unique label for each CDS and exon interval"
      dplyr::group_by(., Parent) %>%
      dplyr::mutate(ID = ifelse(type %in% c("CDS", "exon"),
                                paste(type, start, sep='-'),
                                ID)) %>%
      dplyr::ungroup()
  } %>>% {
    "Make a graph of gene models"
    dplyr::select(., ID, Parent) %>%
      as.matrix %>%
      igraph::graph_from_edgelist()
  }
}


## ------------------------------------------------------------------------
result <-
  system.file('extdata', 'gff', '0.gff3', package='rmonad') %v>% gff_as_graph
result %>% plot

## ------------------------------------------------------------------------
esc(result)

## ------------------------------------------------------------------------
mtabulate(result)

## ------------------------------------------------------------------------
missues(result)

## ---- eval=FALSE---------------------------------------------------------
#  # get a list of every stored value, report uncached values as NULL
#  get_value(result, warn=FALSE)
#  # get a list of every docstring
#  get_doc(result)

## ----gff-workflow-plot, fig.width=6, fig.height=6------------------------
plot(result)

## ------------------------------------------------------------------------
m <-
  system.file('extdata', 'gff', '15.gff3', package='rmonad') %v>%
  gff_as_graph

## ------------------------------------------------------------------------
get_error(m)

## ------------------------------------------------------------------------
mtabulate(m)

## ------------------------------------------------------------------------
missues(m)

## ------------------------------------------------------------------------
get_code(m, 3)

## ------------------------------------------------------------------------
get_value(m, get_parents(m, 3)[[1]])[[1]]

## ------------------------------------------------------------------------
get_code(m, 4:6)

## ------------------------------------------------------------------------
get_value(m, get_parents(m, 5)[[1]])
get_value(m, 5)[[1]]

