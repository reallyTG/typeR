library(RClone)


### Name: export_genclone
### Title: export data file to Adegenet, Genetix and Arlequin
### Aliases: export_genclone_genind export_genclone_genetix
###   export_genclone_arlequin
### Keywords: documentation

### ** Examples


data(posidonia)

#RClone to Adegenet:
res <- export_genclone_genind(posidonia, "/")
#library(adegenet)
#res2 <- df2genind(res, ploidy = 2, sep = "/")
#nAll(res2)

#RClone to Genetix:
export_genclone_genetix(posidonia, name = "test.txt")
#or
write.table(export_genclone_genetix(posidonia), "test2.txt", row.names = FALSE, 
sep = "\t", quote = FALSE)
#for genets only:
export_genclone_genetix(unique(posidonia), name = "test.txt")

#Rclone to Arlequin:
write.table(export_genclone_arlequin(posidonia), "file1.arp", row.names = FALSE,
 col.names = FALSE, quote = FALSE)
#or
export_genclone_arlequin(posidonia, haploid = FALSE, "file2.arp")
#for genets only:
export_genclone_arlequin(unique(posidonia), haploid = FALSE, "file2.arp")

#if several populations:
#res <- split(data, vecpop)
#lapply(res, function(x) export_genclone_genetix(x))
#lapply(res, function(x) export_genclone_arlequin(x))



