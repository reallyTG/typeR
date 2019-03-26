## ------------------------------------------------------------------------
library(ARIbrain)

pvalue_name <- system.file("extdata", "pvalue.nii.gz", package="ARIbrain")
cluster_name <- system.file("extdata", "cluster_th_3.2.nii.gz", package="ARIbrain")
zstat_name <- system.file("extdata", "zstat.nii.gz", package="ARIbrain")
mask_name <- system.file("extdata", "mask.nii.gz", package="ARIbrain")

res_ARI=ARI(Pmap = pvalue_name, clusters= cluster_name,
    mask=mask_name, Statmap = zstat_name)

str(res_ARI)

## ------------------------------------------------------------------------
library(RNifti)


Tmap = readNifti(system.file("extdata", "zstat.nii.gz", package="ARIbrain"))
# compute p-values from Test statistic (refering to Normal distribution, right-side alternative)
Pmap=pnorm(-Tmap)

#Read the mask file. 
mask = RNifti::readNifti(system.file("extdata", "mask.nii.gz", package="ARIbrain"))
# Make sure that it is a logical map by: ()!=0
mask=mask!=0

#Create Clusters using a threshold equal to 3.2
Tmap[!mask]=0
clstr=cluster_threshold(Tmap>3.2)
table(clstr)


res_ARI=ARI(Pmap,clusters = clstr,mask = mask,Statmap = Tmap)


## ------------------------------------------------------------------------
hom=hommel::hommel(Pmap[mask])
(thr_p=hommel::concentration(hom))
(thr_z=-qnorm(thr_p))

Tmap[!mask]=0
clstr=cluster_threshold(Tmap>thr_z)
table(clstr)

res_ARI_conc=ARI(Pmap,clusters = clstr,mask = mask,Statmap = Tmap)

