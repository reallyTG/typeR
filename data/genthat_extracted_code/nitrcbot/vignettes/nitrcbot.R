## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("adigherman/nitrcbot")

## ---- eval = FALSE-------------------------------------------------------
#  set_credentials(username = "XXX", password = "YYY")

## ---- eval = FALSE-------------------------------------------------------
#  nitrc_sets <- nitrcbot::list_image_sets()
#  nitrc_sets_summary <- nitrc_sets[,c("ID","Name","Subjects")]

## ---- eval = FALSE-------------------------------------------------------
#  nitrc_sets_summary
#                     ID                                                           Name Subjects
#  1                  kin                                       Kurtosis Imaging Network       81
#  2  studyforrest_rev003                                           Study Forrest rev003       20
#  3         nki_rockland                                       INDI NKI/Rockland Sample      207
#  4                 PING   Pediatric Imaging, Neurocognition, and Genetics (PING) Study        0
#  5                  ixi                                                    IXI dataset      584
#  6              parktdi High-quality diffusion-weighted imaging of Parkinson's disease       53
#  7       cs_schizbull08                       CANDI Share: Schizophrenia Bulletin 2008      103
#  8             short_tr                                               Beijing Short TR       28
#  9         beijing_eoec                                  Beijing Eyes Open Eyes Closed       48
#  10         beijing_enh                                               Beijing Enhanced      180
#  11               ABIDE                                                          ABIDE     1112
#  12                corr          Consortium for Reliability and Reproducibility (CoRR)     1386
#  13           fcon_1000                                    1000 Functional Connectomes     1288
#  14            adhd_200                                                       ADHD-200      973

## ---- eval = FALSE-------------------------------------------------------
#  ixi_project <- read_nitrc_project('ixi')
#  head(ixi_project)
#                 ID label project gender handedness      session_ID scan_ID   age
#  1 NITRC_IR_S05189     2     ixi female            NITRC_IR_E10452      PD  35.8
#  2 NITRC_IR_S05189     2     ixi female            NITRC_IR_E10452      T1  35.8
#  3 NITRC_IR_S05189     2     ixi female            NITRC_IR_E10452     MRA  35.8
#  4 NITRC_IR_S05189     2     ixi female            NITRC_IR_E10452     DTI  35.8
#  5 NITRC_IR_S05189     2     ixi female            NITRC_IR_E10452      T2  35.8
#  6 NITRC_IR_S05190    12     ixi   male            NITRC_IR_E10453      T1 38.78

## ---- eval = FALSE-------------------------------------------------------
#  ixi_T1_males = ixi_project %>%
#      filter(gender %in% "male") %>%
#      filter(scan_ID %in% "T1") %>%
#      select(ID, session_ID) %>%
#      unique
#  head(ixi_T1_males)

## ---- eval = FALSE-------------------------------------------------------
#                 ID      session_ID
#  1 NITRC_IR_S05190 NITRC_IR_E10453
#  2 NITRC_IR_S05191 NITRC_IR_E10454
#  3 NITRC_IR_S05193 NITRC_IR_E10456
#  4 NITRC_IR_S05194 NITRC_IR_E10457
#  5 NITRC_IR_S05196 NITRC_IR_E10459
#  6 NITRC_IR_S05197 NITRC_IR_E10460

## ---- eval = FALSE-------------------------------------------------------
#  t1_res <- download_nitrc_dir("NITRC_IR_E10453", scan_type="T1")
#  t1_res$files
#  [1] "77390_IXI012-HH-1211-T1.nii.gz" "77391_qc_t.gif"                 "77391_qc.gif"

## ---- eval = FALSE-------------------------------------------------------
#  > download_nitrc_dir("NITRC_IR_E10453", scan_type="T1", zipped = TRUE)
#  [1] "/var/folders/kr/05bm5krj0r3fpwxfdmx4xthm0000gn/T//RtmpVWPpmG/NITRC_IR_E10453.zip"

## ---- eval = FALSE-------------------------------------------------------
#  r <- get_scan_resources('NITRC_IR_E10453')
#  > head(r$URI)
#  [1] "/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-00.nii.gz"
#  [2] "/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-01.nii.gz"
#  [3] "/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-02.nii.gz"
#  [4] "/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-03.nii.gz"
#  [5] "/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-04.nii.gz"
#  [6] "/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-05.nii.gz"

## ---- eval = FALSE-------------------------------------------------------
#  > download_nitrc_file("/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-05.nii.gz")
#  [1] "/var/folders/kr/05bm5krj0r3fpwxfdmx4xthm0000gn/T//RtmpVWPpmG/IXI012-HH-1211-DTI-05.nii.gz"

## ---- eval = FALSE-------------------------------------------------------
#  > get_scan_params('NITRC_IR_E11033')
#    type imagescandata_id      TR     TE flip matrix_X matrix_Y voxel_X voxel_Y voxel_Z frames partitions fieldStrength quality
#  1  DTI            44882 9054.01   80.0   90
#  2  MRA            44883    20.0 6.9052   25
#  3   PD            44884 8178.34    8.0   90
#  4   T1            44885   9.813  4.603    8
#  5   T2            44886 8178.34  100.0   90

