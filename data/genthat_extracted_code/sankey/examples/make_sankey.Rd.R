library(sankey)


### Name: make_sankey
### Title: Create an object that describes a sankey plot
### Aliases: make_sankey

### ** Examples

## Function calls in the pkgsnap package:
edges <- read.table(stringsAsFactors = FALSE, textConnection(
"                get_deps          get_description
                 get_deps               parse_deps
                 get_deps                     %||%
                 get_deps            drop_internal
          get_description        pkg_from_filename
               parse_deps                 str_trim
                cran_file             get_pkg_type
                cran_file          r_minor_version
            download_urls split_pkg_names_versions
            download_urls                cran_file
             pkg_download               dir_exists
             pkg_download            download_urls
             pkg_download        filename_from_url
             pkg_download             try_download
                  restore             pkg_download
                  restore        drop_missing_deps
                  restore            install_order
                  restore                 get_deps
 split_pkg_names_versions               data_frame
"))
pkgsnap_sankey <- make_sankey(edges = edges)
sankey(pkgsnap_sankey)

## Some customization
nodes <- data.frame(
  stringsAsFactors = FALSE,
  id = c("snap", sort(unique(c(edges[,1], edges[,2]))))
)
nodes$col <- ifelse(nodes$id %in% c("snap", "restore"), "orange", "#2ca25f")
edges$colorstyle <- "gradient"

sankey(make_sankey(nodes, edges))



