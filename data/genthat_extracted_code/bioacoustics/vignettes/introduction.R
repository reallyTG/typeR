## ---- echo=FALSE,message=FALSE,warning=FALSE-----------------------------
library(bioacoustics)
data(myotis)
Img <- fspec(myotis, tlim = c(2.65, 2.8), rotate = TRUE)

par(mfrow = c(2,2))
par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))

image(Img, col = heat.colors(21), xaxt='n', yaxt = 'n', ann = FALSE)

image(Img, col = heat.colors(21), xaxt='n', yaxt = 'n', ann = FALSE)
points(x = 0.47, y = 0.2, lwd = 1.5, pch = 19)

image(Img, col = heat.colors(21), xaxt='n', yaxt='n', ann = FALSE)
points(x = 0.47, y = 0.2, lwd = 1.5,pch = 19)
arrows(
  x0 = 0.47, x1 = 0.33, y0 = 0.2, y1 = 0.38, length = 0.1,
  code = 2, col = par('fg'), lty = par('lty'), lwd = 1
)

image(Img, col = heat.colors(21), xaxt = 'n', yaxt = 'n', ann = FALSE)
points(x = 0.47, y = 0.2, lwd = 1.5, pch = 19)
arrows(
  x0 = 0.47, x1 = 0.33, y0=0.2, y1 = 0.38, length = 0.1,
  code = 2, col = par('fg'), lty = par('lty'), lwd = 1
)
arrows(
  x0 = 0.47, x1 = 0.54, y0=0.2, y1 = 0.13, length = 0.1,
  code = 2, col = par('fg'), lty = par('lty'), lwd = 1
)

rm(myotis,Img)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(
  as.data.frame(
    cbind(
      c('starting_time', 'duration', 'freq_max_amp', 'freq_max', 'freq_min', 'bandwidth', 'freq_start', 'freq_center', 'freq_end','freq_knee','freq_c','freq_bw_knee_fc',
        'bin_max_energy','pc_freq_max_amp','pc_freq_min','pc_fmax','pc_knee','temp_bw_knee_fc','slope',
        'kalman_slope','curve_pos_start','curve_pos_end','curve_neg','mid_offset','snr',
        'harmonic_distortion','smoothness'),
      c('sec','ms','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','%','%','%','%','ms','Hz / ms','Hz / ms','Hz / ms','Hz / ms','dB','dB','dB',''),
      c('Location of the audio event in the recording',
        'Duration of the audio event',
        'Frequency of the maximum energy of the audio event',
        'Highest frequency of the audio event',
        'Lowest frequency of the audio event',
        #'Frequency spread of the audio event',
        'Difference between the highest (freq_max) and lowest (freq_min) frequencies',
        'Frequency at the start of the audio event',
        'Frequency at the half of the audio event',
        'Frequency at the end of the audio event',
        'Frequency at which the slope is the steepest (knee)',
        'Frequency at which the slope is the flatest (caracteristic frequency)',  
        'Frequency bandwith between the knee and caracteristic frequency',
        'Frequency at the maximum of energy where the slope is the flatest',
        'Location of the frequency with the maximum of energy',
        'Location of the minimum frequency',
        'Location of the maximum frequency',
        'Location of the frequency at which the slope is the steepest',
        'Temporal bandwith between the knee and caracteristic frequency',
        'Raw slope estimate (frequency bandwith against duration)',
        'Smoothed slope estimate after Kalman filtering',
        'Slope estimate at the begining of the audio event',
        'Slope estimate at the end of the audio event',
        'Slope negative antropy',
        'Mid-offset',
        'Signal to noise ratio',
        'Level of harmonic distortion',
        'Time / frequency regularity'
      )
    )
  ),
  col.names = c('Feature','Unit','Description')
)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(
  as.data.frame(
    cbind(
      c('starting_time', 'duration','area','freq_centroid','freq_bandwith','freq_skew','freq_kurtosis','q','freq_gini_impurity','quant_2.5','quant_25','quant_50','quant_75','quant_97.5','freq_bw_95_ci','freq_bw_75_ci','temp_centroid','temp_bandwith','temp_skew','temp_kurtosis','temp_gini_impurity','grad_centroid',
        'grad_bandwith','grad_skew','grad_kurtosis','grad_gini_impurity'),
      c('sec','ms','pixels','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','Hz','ms','ms','ms','ms','ms','','','','',''),
      c('Location of the audio event in the recording',
        'Duration of the audio event',
        'Estimated area of the audio event (in pixels)',
        'Frequency at the centroid of the extracted audio event',
        'Difference between the highest (freq_max) and lowest (freq_min) frequencies',
        'Skewness of the frequency distribution of the audio event',
        'Kurtosis of the frequency distribution of the audio event',
        'Centroid frequency divided by the frequency bandwith of the audio event',
        'Degree of smoothness of the frequency distribution of the audio event',
        '2.5 percentile of the frequency distribution of the audio event',
        '25 percentile of the frequency distribution of the audio event',
        '50 percentile of the frequency distribution of the audio event',
        '75 percentile of the frequency distribution of the audio event',
        '97.5 percentile of the frequency distribution of the audio event',
        'Frequency bandwith between the 97.5 and the 2.5 percentiles',
        'Frequency bandwith between the 75 and the 25 percentiles',
        'Time at the centroid of the extracted audio event',
        'Time difference between the begining and the end of the audio event',
        'Skewness of the time distribution of the audio event',
        'Kurtosis of the time distribution of the audio event',
        'Degree of smoothness of the temporal distribution of the audio event',
        'Gradient at the centroid of the extracted audio event',
        'Gradient difference between the begining and the end of the audio event',
        'Skewness of the gradient distribution of the audio event',
        'Kurtosis of the gradient distribution of the audio event',
        'Degree of smoothness of the gradient distribution of the audio event'
      )
    )
  ),
  col.names = c('Feature','Unit','Description')
)

## ----see_also, eval=FALSE------------------------------------------------
#  # Package tutorial
#  vignette("tutorial", package = "bioacoustics")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(
  as.data.frame(
    cbind(
      c('threshold','time_exp','min_dur','max_dur','min_TBE','max_TBE','EDG','LPF','HPF','FFT_size','FFT_overlap','start_thr','end_thr','SNR_thr','angle_thr','duration_thr', 'NWS', 'KPE','KME'),
      c(14,1,1.5,80,30,1000,0.996,250000,16000,256,0.875,40,20,10,40,80,100,0.00001,0.00001),
      c(12,1,140,440,300,5000,0.996,8000,2000,256,0.875,25,30,10,45,440,1000,0.00001,0.0001))),
  col.names = c('Parameters','Eastern canadian bats','Bicknell\'s Thrush calls')
)

