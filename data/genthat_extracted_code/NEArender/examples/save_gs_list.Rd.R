library(NEArender)


### Name: save_gs_list
### Title: Create a TAB-delimited text file from AGS or FGS
### Aliases: save_gs_list

### ** Examples

data(net.kegg)
netpath <- net.kegg
net <- import.net(netpath);
fgs.genes <- as_genes_fgs(net);
save_gs_list(fgs.genes, File = "single_gene_ags.groups.tsv");



