## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Import required packages
library(alakazam)
library(shazam)
library(dplyr)
library(ggplot2)

# Load and subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE %in% c("IgA", "IgG") & SAMPLE == "+7d")

## ---- eval=TRUE----------------------------------------------------------
# Calculate R and S mutation counts
db_obs <- observedMutations(db, sequenceColumn="SEQUENCE_IMGT",
                            germlineColumn="GERMLINE_IMGT_D_MASK",
                            regionDefinition=NULL,
                            frequency=FALSE, 
                            nproc=1)
# Show new mutation count columns
db_obs %>% 
    select(SEQUENCE_ID, starts_with("MU_COUNT_")) %>%
    head(n=4)

# Calculate R and S mutation frequencies
db_obs <- observedMutations(db_obs, sequenceColumn="SEQUENCE_IMGT",
                            germlineColumn="GERMLINE_IMGT_D_MASK",
                            regionDefinition=NULL,
                            frequency=TRUE, 
                            nproc=1)
# Show new mutation frequency columns
db_obs %>% 
    select(SEQUENCE_ID, starts_with("MU_FREQ_")) %>%
    head(n=4)

## ---- eval=TRUE----------------------------------------------------------
# Calculate combined R and S mutation frequencies
db_obs <- observedMutations(db, sequenceColumn="SEQUENCE_IMGT",
                            germlineColumn="GERMLINE_IMGT_D_MASK",
                            regionDefinition=NULL,
                            frequency=TRUE, 
                            combine=TRUE,
                            nproc=1)
# Show new mutation frequency columns
db_obs %>% 
    select(SEQUENCE_ID, starts_with("MU_FREQ_")) %>%
    head(n=4)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
g1 <- ggplot(db_obs, aes(x=ISOTYPE, y=MU_FREQ, fill=ISOTYPE)) +
    theme_bw() + ggtitle("Total mutations") +
    xlab("Isotype") + ylab("Mutation frequency") +
    scale_fill_manual(name="Isotype", values=IG_COLORS) +
    geom_boxplot()
plot(g1)

## ---- eval=TRUE----------------------------------------------------------
# Calculate R and S mutation counts for individual CDRs and FWRs
db_obs_v <- observedMutations(db, sequenceColumn="SEQUENCE_IMGT",
                              germlineColumn="GERMLINE_IMGT_D_MASK",
                              regionDefinition=IMGT_V_BY_REGIONS,
                              frequency=FALSE, 
                              nproc=1)
# Show new FWR mutation columns
db_obs_v %>% 
    select(SEQUENCE_ID, starts_with("MU_COUNT_FWR")) %>%
    head(n=4)

# Calculate aggregate CDR and FWR V-segment R and S mutation frequencies
db_obs_v <- observedMutations(db_obs_v, sequenceColumn="SEQUENCE_IMGT",
                              germlineColumn="GERMLINE_IMGT_D_MASK",
                              regionDefinition=IMGT_V,
                              frequency=TRUE, 
                              nproc=1)
# Show new CDR and FWR mutation frequency columns
db_obs_v %>% 
    select(SEQUENCE_ID, starts_with("MU_FREQ_")) %>%
    head(n=4)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
g2 <- ggplot(db_obs_v, aes(x=ISOTYPE, y=MU_FREQ_CDR_S, fill=ISOTYPE)) +
    theme_bw() + ggtitle("CDR silent mutations") +
    xlab("Isotype") + ylab("Mutation frequency") +
    scale_fill_manual(name="Isotype", values=IG_COLORS) +
    geom_boxplot()
g3 <- ggplot(db_obs_v, aes(x=ISOTYPE, y=MU_FREQ_CDR_R, fill=ISOTYPE)) +
    theme_bw() + ggtitle("CDR replacement mutations") +
    xlab("Isotype") + ylab("Mutation frequency") +
    scale_fill_manual(name="Isotype", values=IG_COLORS) +
    geom_boxplot()
alakazam::gridPlot(g2, g3, ncol=2)

## ---- eval=TRUE----------------------------------------------------------
# Calculate charge mutation frequency for the full sequence
db_obs_ch <- observedMutations(db, sequenceColumn="SEQUENCE_IMGT",
                               germlineColumn="GERMLINE_IMGT_D_MASK",
                               regionDefinition=NULL,
                               mutationDefinition=CHARGE_MUTATIONS,
                               frequency=TRUE, 
                               nproc=1)
# Show new charge mutation frequency columns
db_obs_ch %>% 
    select(SEQUENCE_ID, starts_with("MU_FREQ_")) %>%
    head(n=4)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
g4 <- ggplot(db_obs_ch, aes(x=ISOTYPE, y=MU_FREQ_SEQ_R, fill=ISOTYPE)) +
    theme_bw() + ggtitle("Charge replacement mutations") +
    xlab("Isotype") + ylab("Mutation frequency") +
    scale_fill_manual(name="Isotype", values=IG_COLORS) +
    geom_boxplot()
plot(g4)

