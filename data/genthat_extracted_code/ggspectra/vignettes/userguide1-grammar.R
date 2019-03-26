## ------------------------------------------------------------------------
library(ggplot2)
library(scales)
library(photobiology)
library(photobiologyWavebands)
library(ggspectra)
library(ggrepel)

good_label_repel <- packageVersion('ggrepel') != "0.8.0" #||
#  packageVersion('ggplot2') >= "3.1.0"


## ---- include=FALSE, echo=FALSE------------------------------------------
library(knitr)
opts_chunk$set(fig.align = 'center', 
               fig.show = 'hold', fig.width = 7, fig.height = 4,
               cache = FALSE)
options(warnPartialMatchArgs = FALSE)

## ------------------------------------------------------------------------
two_suns.mspct <- source_mspct(list(sun1 = sun.spct, sun2 = sun.spct / 2))

## ------------------------------------------------------------------------
two_suns.spct <- rbindspct(two_suns.mspct)

## ------------------------------------------------------------------------
theme_set(theme_bw())

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line()

## ------------------------------------------------------------------------
ggplot(two_suns.spct) + aes(color = spct.idx) + geom_line()

## ------------------------------------------------------------------------
ggplot(two_suns.spct, aes(w.length, s.e.irrad, color = spct.idx)) + geom_line()

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") + geom_line()

## ------------------------------------------------------------------------
photon_as_default()
ggplot(sun.spct) + geom_line()
ggplot(sun.spct, unit.out = "energy") + geom_line()

## ------------------------------------------------------------------------
unset_user_defaults()

## ------------------------------------------------------------------------
ggplot(yellow_gel.spct) + geom_line()

## ------------------------------------------------------------------------
ggplot(yellow_gel.spct, plot.qty = "absorbance") + geom_line()

## ------------------------------------------------------------------------
Afr_as_default()
ggplot(yellow_gel.spct) + geom_line()
ggplot(polyester.spct) + geom_line()
unset_user_defaults()

## ------------------------------------------------------------------------
ggplot(two_suns.mspct) + 
  aes(linetype = spct.idx) +
  wl_guide(ymax = -0.05) +
  geom_line()

## ------------------------------------------------------------------------
ggplot(two_suns.mspct) + 
  wl_guide(ymax = -0.05) +
  geom_spct() +
  geom_line() +
  facet_wrap(~spct.idx, ncol = 1L)

## ------------------------------------------------------------------------
ggplot(two_suns.mspct) + 
  wl_guide(ymax = -0.05) +
  geom_spct() +
  geom_line() +
  facet_wrap(~spct.idx, ncol = 1L, scales = "free_y")

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  geom_line() +
  scale_x_wl_continuous()

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  geom_line() +
  scale_x_wl_continuous(sec.axis = sec_axis_w_number())

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  geom_line() +
  scale_x_wl_continuous(sec.axis = sec_axis_w_frequency())

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  geom_line() +
  scale_x_wl_continuous(sec.axis = sec_axis_w_frequency(15))

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  geom_line() +
  scale_x_wl_continuous(sec.axis = sec_axis_w_frequency(14))

## ------------------------------------------------------------------------
nearest_SI_exponent(14)

## ------------------------------------------------------------------------
ggplot(white_led.raw_spct) + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_counts_continuous()
  

## ------------------------------------------------------------------------
ggplot(white_led.raw_spct) + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_counts_tg_continuous()
  

## ------------------------------------------------------------------------
ggplot(white_led.cps_spct) + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_counts_continuous()
  

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_s.e.irrad_continuous()

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_s.q.irrad_continuous()

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  geom_line() +
  scale_x_wl_continuous(-6) +
  scale_y_s.e.irrad_continuous(-3)

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_s.q.irrad_continuous(unit.exponent = 0,
                               labels = scientific_format())

## ------------------------------------------------------------------------
library(scales)
ggplot(sun.spct, unit.out = "photon") + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_s.q.irrad_continuous(unit.exponent = 0,
                               labels = SI_tg_format(exponent = -6))

## ------------------------------------------------------------------------
temp.spct <- clean(sun.spct, range.s.data = c(1e-20, Inf), fill = 1e-20)
ggplot(temp.spct, unit.out = "photon") + 
  geom_line(na.rm = TRUE) +
  scale_x_wl_continuous() +
  scale_y_s.q.irrad_continuous(unit.exponent = 0,
                               trans = "log10",
                               labels = trans_format("log10", math_format()),
                               limits = c(1e-12, NA))

## ------------------------------------------------------------------------
ggplot(ccd.spct, unit.out = "photon") + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_s.q.response_continuous()

## ------------------------------------------------------------------------
ggplot(ccd.spct, unit.out = "photon") + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_s.q.response_continuous(trans = "log10",
                                  labels = trans_format("log10", math_format()))

## ------------------------------------------------------------------------
ggplot(yellow_gel.spct) + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_Tfr_total_continuous()
  

## ------------------------------------------------------------------------
ggplot(yellow_gel.spct) + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_Tfr_total_continuous(labels = percent)
  

## ------------------------------------------------------------------------
ggplot(yellow_gel.spct, plot.qty = "absorbance") + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_A_total_continuous()

## ------------------------------------------------------------------------
ggplot(green_leaf.spct) + 
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_Rfr_total_continuous()

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + stat_peaks(color = "red")

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") + geom_line() + stat_peaks(color = "red")

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + stat_valleys(color = "blue")

## ------------------------------------------------------------------------
ggplot(yellow_gel.spct) + geom_line() + stat_find_wls(color = "darkgreen")

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_peaks(shape = 21, color = "black") + scale_fill_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_peaks(span = 21, shape = 4, color = "red", size = 2) +
  stat_peaks(span = 21, color = "red", geom = "rug", sides = "b")

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_peaks(span = 21, geom = "text", color = "red", vjust = "bottom") 

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_peaks(shape = 21, span = 25, size = 2) + 
  scale_fill_identity() +
  stat_peaks(aes(color = ..BW.color..), 
             geom = "label", span = 25, vjust = "bottom", size = 3) + 
  scale_color_identity()

## ---- eval=good_label_repel----------------------------------------------
#  ggplot(sun.spct) + geom_line() +
#    stat_peaks(shape = 21, span = 25, size = 2) +
#    stat_label_peaks(geom = "label_repel", span = 41,
#                     size = 3.5, nudge_y = 0.075, segment.colour = "black") +
#    stat_valleys(shape = 21, span = 25, size = 2) +
#    stat_label_valleys(geom = "label_repel", span = 51,
#                       size = 3.5, nudge_y = -0.075, segment.colour = "black") +
#    scale_fill_identity() + scale_color_identity() +
#    expand_limits(y = c(-0.08, 0.9))

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_peaks(shape = 21, span = 25, size = 2) + scale_fill_identity() +
  stat_label_peaks(geom = "label", span = 25, size = 3, na.rm = TRUE) +
  scale_color_identity() +
  expand_limits(y = c(NA, 0.9))

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_peaks(span = NULL, geom = "vline", linetype = "dotted", color = "red") +
  stat_peaks(span = NULL, geom = "hline", linetype = "dotted", color = "red")

## ---- eval=good_label_repel----------------------------------------------
#  ggplot(sun.spct) + geom_line() +
#    stat_label_peaks(span = 31, geom = "label_repel",
#               label.fmt = "y = %1.2f", segment.colour = "red",
#               min.segment.length = unit(0.05, "lines"),
#               nudge_y = 0.1) +
#    expand_limits(y = 1) +
#    scale_fill_identity() + scale_color_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_peaks(span = NULL, color = "red") +
  stat_peaks(span = NULL, geom = "text", vjust = -0.5, color = "red", 
             aes(label = paste(..y.label.., "at", ..x.label.. , "nm"))) +
  expand_limits(y = c(NA, 0.9))

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_peaks(span = 21, geom = "point", colour = "red") +
  stat_valleys(span = 21, geom = "point", colour = "blue") +
  stat_peaks(span = 51, geom = "text", colour = "red", 
             vjust = -0.3, label.fmt = "%3.0f nm") +
  stat_valleys(span = 51, geom = "text", colour = "blue", 
               vjust = 1.2, label.fmt = "%3.0f nm")

## ------------------------------------------------------------------------
ggplot(two_suns.spct) + aes(color = spct.idx) +
  geom_line() + ylim(NA, 1.8) +
  stat_peaks(span = NULL, color = "black") +
  stat_peaks(span = NULL, geom = "text", vjust = -0.5, size = 3, 
             color = "black", 
             aes(label = paste(..y.label.., "at", ..x.label.. , "nm"))) +
  facet_grid(spct.idx~.)

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  stat_color() + scale_color_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  geom_line() +
  stat_color(shape = 21, color = "black") + 
  scale_fill_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  stat_color(geom = "bar") + 
  geom_point(shape = 21, color = "black", stroke = 1.2, fill = "white") +
  scale_fill_identity() + 
  scale_color_identity() + 
  theme_bw()

## ------------------------------------------------------------------------
ggplot(two_suns.spct) + aes(shape = spct.idx) +
  stat_color() + scale_color_identity() +
  geom_line() + 
  facet_grid(spct.idx~., scales = "free_y")

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_wb_box(w.band = VIS_bands(), color = "white") +
  scale_fill_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) + stat_wb_column(w.band = VIS_bands()) + geom_line() +
  scale_fill_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_wb_hbar(w.band = VIS_bands(), size = 1.2) +
  scale_color_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + 
  stat_wb_box(w.band = PAR(), color = "white", ypos.fixed = 0.85) +
  stat_wb_label(w.band = PAR(), ypos.fixed = 0.85) +
  scale_fill_identity() + scale_color_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_line() + stat_wl_summary()

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  stat_wl_summary(range = c(300,350), geom = "rect") +
  geom_line()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  geom_line() + 
  stat_wl_summary(geom = "hline", color = "red") +
  stat_wl_summary(label.fmt = "Mean = %.3g", color = "red", vjust = -0.3)

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wl_summary(range = c(400,500), geom = "rect", alpha = 0.2, fill = color_of(450)) +
  stat_wl_summary(range = c(400,500), label.fmt = "Mean = %.3g", vjust = -0.3, geom = "text") + 
  geom_line()

## ------------------------------------------------------------------------
ggplot(two_suns.spct) + aes(color = spct.idx) +
  geom_line() + 
  stat_wl_summary(geom = "hline") +
  stat_wl_summary(label.fmt = "Mean = %.3g", vjust = 1.2, show.legend = FALSE) +
  facet_grid(spct.idx~.)

## ------------------------------------------------------------------------
ggplot(two_suns.spct) + aes(color = spct.idx) +
  geom_line() + 
  stat_wl_summary(geom = "hline") +
  stat_wl_summary(label.fmt = "Mean = %.3g", vjust = 1.2, show.legend = FALSE) +
  facet_grid(spct.idx~., scales = "free_y")

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  geom_line() + 
  stat_wb_hbar(w.band = PAR(), size = 1.3) +
  stat_wb_mean(aes(color = ..wb.color..), w.band = PAR(), ypos.mult = 0.95) +
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wb_hbar(w.band = c(400,500), size = 1.2) +
  stat_wb_mean(aes(color = ..wb.color..),
               w.band = c(400,500), ypos.mult = 0.95) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  geom_line() + 
  stat_wb_hbar(w.band = list(Blue(), Red()), size = 1.2) +
  stat_wb_mean(aes(color = ..wb.color..),
               w.band = list(Blue(), Red()), ypos.mult = 0.95, 
               hjust = 1, angle = 90) +
  scale_color_identity() + 
  scale_fill_identity() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wb_box(w.band = PAR()) +
  stat_wb_total(w.band = PAR()) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wb_box(w.band = c(400,500)) +
  stat_wb_total(w.band = c(400,500)) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct * yellow_gel.spct) +
  stat_wb_box(w.band = Plant_bands(), color = "white", ypos.fixed = 0.7) +
  stat_wb_column(w.band = Plant_bands(), color = "white", alpha = 0.5) +
  stat_wb_mean(w.band = Plant_bands(), label.fmt = "%1.2f",
               ypos.fixed = 0.7, size = 2) +
  geom_line() + 
  scale_fill_identity() + scale_color_identity() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wb_box(w.band = PAR()) +
  stat_wb_irrad(w.band = PAR(), unit.in = "energy", time.unit = "second") +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") +
  stat_wb_box(w.band = PAR()) +
  stat_wb_irrad(w.band = PAR(),
                unit.in = "photon", time.unit = "second", 
                aes(label = sprintf("%s = %.3g", ..wb.name.., ..wb.yint.. * 1e6))) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wb_box(w.band = PAR()) +
  stat_wb_e_irrad(w.band = PAR()) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wb_box(w.band = CIE()) +
  stat_wb_e_irrad(w.band = CIE()) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.daily.spct) +
  stat_wb_box(w.band = CIE()) +
  stat_wb_e_irrad(w.band = CIE(), time.unit = "day", label.mult = 1e-3) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") +
  stat_wb_box(w.band = VIS_bands(), color = "black") +
  stat_wb_column(w.band = VIS_bands(), color = NA, alpha = 0.5) +
  stat_wb_q_irrad(w.band = VIS_bands(), label.mult = 1e6, size = 2) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  geom_line() + 
  stat_wb_hbar(w.band = PAR(), size = 1.4) +
  stat_wb_e_sirrad(aes(color = ..wb.color..), 
                   w.band = PAR(), ypos.mult = 0.95) +
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") +
  stat_wb_column(w.band = PAR(), alpha = 0.8) +
  stat_wb_q_sirrad(w.band = PAR(), 
                   mapping =
                     aes(label = sprintf("Total %s = %.3g", 
                                         ..wb.name.., ..wb.yint.. * 1e6)), 
                   ypos.mult = 0.55) +
  stat_wb_q_sirrad(w.band = PAR(),
                   mapping = 
                     aes(label = sprintf("Mean %s = %.3g", 
                                         ..wb.name.., ..wb.ymean.. * 1e6)), 
                   ypos.mult = 0.45) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wb_box(w.band = waveband(CIE()), ypos.fixed = 0.85) +
  stat_wb_e_sirrad(w.band = CIE(), ypos.fixed = 0.85) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.daily.spct) +
  stat_wb_box(w.band = waveband(CIE()), ypos.fixed = 34e3) +
  stat_wb_e_sirrad(w.band = CIE(),
                   label.fmt = "%.2g kj / day",
                   time.unit = "day",
                   ypos.fixed = 34e3) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
my.bands <- split_bands(c(300,800), length.out = 10)
ggplot(sun.spct, unit.out = "photon") +
  stat_wb_hbar(w.band = my.bands, size = 1.4) +
  stat_wb_q_sirrad(geom = "label", w.band = my.bands, 
                   size = 2.5, ypos.fixed = 3.5e-6) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wb_column(w.band = VIS_bands(), alpha = 0.5) +
  stat_wb_e_irrad(w.band = VIS_bands(), angle = 90,
                   ypos.fixed = 0.05, hjust = 0,
                   aes(label = paste(..wb.name.., ..y.label.., sep = " = "))) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") +
  stat_wb_column(w.band = VIS_bands(), alpha = 0.5) +
  stat_wb_q_irrad(w.band = VIS_bands(), angle = 90, 
                  label.mult = 1e6, ypos.fixed = 1e-7, hjust = 0,
                  aes(label = paste(..wb.name.., ..y.label.., sep = " = "))) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
my.bands <- split_bands(c(300,800), length.out = 10)
ggplot(sun.spct) +
  stat_wb_column(w.band = my.bands, alpha = 0.5) +
  stat_wb_e_irrad(w.band = my.bands, angle = 90,
                  ypos.fixed = 0.05, hjust = 0) +
  geom_line() + 
  scale_color_identity() + 
  scale_fill_identity() +  
  theme_bw()

## ------------------------------------------------------------------------
ggplot(data.frame(w.length = 300:800), aes(w.length)) +
  stat_wl_strip(w.band = VIS_bands(), ymax = Inf, ymin = -Inf) +
  stat_wb_label(w.band = VIS_bands(), angle = 90) +
  scale_fill_identity() + 
  scale_color_identity() + 
  scale_y_continuous(labels = NULL) +
  scale_x_continuous(breaks = seq(from = 300, to = 800, by = 25)) +
  labs(x = "Wavelength (nm)", title = "Colours according to ISO standard") +
  theme_minimal()


## ------------------------------------------------------------------------
ggplot(data.frame(w.length = 300:1100), aes(w.length)) +
  stat_wl_strip(w.band = RBV_bands(), ymax = 1, ymin = 3) +
  stat_wb_label(w.band = RBV_bands(), ypos.fixed = 2, angle = 90, vjust = 0.3, size = 3) +
  stat_wl_strip(w.band = MSS_bands(), ymax = 4, ymin = 6, na.rm = TRUE) +
  stat_wb_label(w.band = MSS_bands(), ypos.fixed = 5, angle = 90, vjust = 0.3, size = 3) +
  stat_wl_strip(w.band = ETM_bands(), ymax = 7, ymin = 9, na.rm = TRUE) +
  stat_wb_label(w.band = ETM_bands(), ypos.fixed = 8, angle = 90, vjust = 0.3, size = 3) +
  stat_wl_strip(w.band = OLI_bands(), ymax = 10, ymin = 12, na.rm = TRUE) +
  stat_wb_label(w.band = OLI_bands(), ypos.fixed = 11, angle = 90, vjust = 0.3, size = 3) +
  scale_fill_identity() + 
  scale_color_identity() + 
  scale_y_continuous(labels = c("RBV", "MSS", "TM/ETM", "OLI"), 
                     breaks = c(2,5,8,11),
                     limits = c(0, 13),
                     name = "Imager",
                     sec.axis = dup_axis(labels = c("L1-L2", "L1-L5", "L4-L7", "L8"), name = "Landsat mission")) +
  scale_x_continuous(breaks = seq(from = 300, to = 1200, by = 100),
                     limits = c(400, 1100),
                     sec.axis = dup_axis()) +
  labs(x = "Wavelength (nm)", title = "Landsat imagers: VIS and NIR bands") +
  theme_classic()

## ------------------------------------------------------------------------
ggplot(data.frame(w.length = 100:400), aes(w.length)) +
  stat_wl_strip(w.band = UV_bands("ISO"), ymax = 1, ymin = 3, color = "white") +
  stat_wb_label(w.band = UV_bands("ISO"), ypos.fixed = 2, size = 3) +
  stat_wl_strip(w.band = UV_bands("CIE"), ymax = 4, ymin = 6, color = "white") +
  stat_wb_label(w.band = UV_bands("CIE"), ypos.fixed = 5, size = 3) +
  stat_wl_strip(w.band = UV_bands("none"), ymax = 7, ymin = 9, color = "white") +
  stat_wb_label(w.band = UV_bands("none"), ypos.fixed = 8, size = 3) +  
  stat_wl_strip(w.band = UV_bands("medical"), ymax = 10, ymin = 12, color = "white") +
  stat_wb_label(w.band = UV_bands("medical"), ypos.fixed = 11, size = 3) +

  scale_fill_identity() + 
  scale_color_identity() + 
  scale_y_continuous(labels = c("ISO", "CIE", "none", "medical"), 
                     breaks = c(2,5,8,11),
                     limits = c(0, 13),
                     name = "Standard",
                     sec.axis = dup_axis(labels = 
                      c("use", "use", "avoid!", "avoid!"), name = "Recommendation")) +
  scale_x_continuous(breaks = c(seq(from = 100, to = 400, by = 50), 280, 315),
                     limits = c(100, 400),
                     sec.axis = 
                       dup_axis(breaks = 
                                c(100, 150, 200, 220, 250, 290, 320, 340, 400))) +
  labs(x = "Wavelength (nm)", title = "UV bands",
       subtitle = "According to ISO standard, CIE recommendations, and non-standard use") +
  theme_classic()

## ------------------------------------------------------------------------
my.data <- data.frame(x = 300:800)
ggplot(my.data, aes(x)) + stat_wl_strip(ymin = -1, ymax = 1, color = NA) +
    scale_fill_identity()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  geom_line() +
  stat_wl_strip(ymin = -Inf, ymax = -0.025) + 
  scale_fill_identity() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  geom_line() + 
  stat_wl_strip(w.band = VIS_bands(), ymin = -Inf, ymax = -0.025) + 
  scale_fill_identity() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wl_strip(w.band = VIS_bands(), ymin = -Inf, ymax = Inf, alpha = 0.4) + 
  scale_fill_identity() +
  geom_line() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) +
  stat_wl_strip(alpha = 0.4, ymin = -Inf, ymax = Inf) + 
  scale_fill_identity() +
  geom_line() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct, unit.out = "photon") +
  stat_wl_strip(alpha = 0.4, ymin = -Inf, ymax = Inf) + 
  stat_wb_box(w.band = PAR()) +
  stat_wb_total(w.band = PAR(), label.mult = 1e6,
                aes(label = paste(..wb.name.., " = ", ..y.label.., sep = ""))) +  
  geom_line() + 
  scale_fill_identity() + scale_color_identity() +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(sun.spct) + geom_spct()

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  geom_spct(fill = color_of(sun.spct))

## ------------------------------------------------------------------------
ggplot(sun.spct * yellow_gel.spct) + 
  geom_spct(fill = color_of(sun.spct * yellow_gel.spct))

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  wl_guide(alpha = 0.4) +
  geom_line()

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  wl_guide(ymax = -0.025) +
  geom_line() 

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  wl_guide() +
  geom_spct(alpha = 0.75, colour = "white", size = 1) 

## ------------------------------------------------------------------------
ggplot(sun.spct) + 
  wl_guide() +
  geom_line(size = 2, colour = "white") +
  geom_line(size = 1, colour = "black") +
  geom_hline(yintercept = 0, colour = "grey92") +
  theme_bw()

## ------------------------------------------------------------------------
color_chart(colors())

## ------------------------------------------------------------------------
color_chart(grep("blue", colors(), value = TRUE), ncol = 5, text.size = 4)

## ------------------------------------------------------------------------
 color_chart(w_length2rgb(570:689, color.name = as.character(570:689)), 
            use.names = TRUE, text.size = 4) +
  ggtitle("Reddish colors", subtitle = "Labels: wavelength (nm)")

