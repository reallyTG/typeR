## ----rsetup-knitr,eval=TRUE,include=FALSE-----------------
require(knitr)
options(width=60)
opts_chunk$set(cache=TRUE)

## ---------------------------------------------------------
require(meaRtools)

## ---------------------------------------------------------
poisson_train <- function(n = 1000, rate = 1, beg = 0) {
  ## Generate a Poisson spike train with N spikes and firing rate RATE.
  ## BEG is time of start of recording
  ## Check that the histogram looks exponentially distributed.
  ## hist( diff(poisson_train()))
  x <- runif(n)
  isi <- log(x) / rate
  spikes <- beg - cumsum(isi)
  spikes
}

a = poisson_train()
b = sort(a + runif(length(a), -0.1, 0.1))
c = b + 0.8
allspikes = list(a=a, b=b, c=c)

## ---------------------------------------------------------
range = range(unlist(allspikes))
beg = range[1]
end = range[2]
sttc(a, b, dt=0.01, rec_time = c(beg, end))

## ---------------------------------------------------------
sttc_allspikes1(allspikes, 0.01, beg, end)

## ---- fig.width = 6, fig.height=6-------------------------
par(mfrow=c(2,2), las=1)
dt = 1.0;  plot(sttcp(a, b, dt = dt, beg = beg, end = end), main=sprintf("a x b: dt = %.3f",dt))
dt = 0.5;  plot(sttcp(a, c, dt = dt, beg = beg, end = end), main=sprintf("a x c: dt = %.3f",dt))
dt = 0.1;  plot(sttcp(a, c, dt = dt, beg = beg, end = end), main=sprintf("a x c: dt = %.3f",dt))
dt = 0.05; plot(sttcp(a, c, dt = dt, beg = beg, end = end), main=sprintf("a x c: dt = %.3f",dt))

## ---------------------------------------------------------
demas_platelayout = list(n_well = 6,
                        wells = paste0("w", 1:6),
                        n_well_r = 2,
                        n_well_c = 3,
                        layout = c(3, 2),
                        n_elec_r = 8,
                        n_elec_c = 8,
                        xlim = c(-100, 7200),
                        ylim = c(0, 6000),
                        spacing = 200,
                        corr_breaks = 0
                        )
add_plateinfo("demas-6well", demas_platelayout)
times = system.file("extdata/textreader/demas.times", package="meaRtools")
pos = system.file("extdata/textreader/demas.pos", package="meaRtools")
s = read_spikelist_text(times, pos, array="demas-6well")

## ---------------------------------------------------------
sttc_results = compute_sttc_by_well(s)
head(sttc_results)

## ----fig.width = 6, fig.height=6--------------------------
require(lattice)
xyplot(STTC ~ Distance | Well, data = sttc_results,
       main = "STTC by well",
       pch=20, xlab = "Distance (um)")

## ---------------------------------------------------------
sttc_file = tempfile(fileext=".csv")
write.csv(sttc_results, file=sttc_file, row.names=FALSE)

## ---------------------------------------------------------
cat(readLines(sttc_file, 10), sep='\n')

