library("photobiology")
library("photobiologyInOut")
library("colorSpec")

context("objects from foreign packages")

test_that("colorSpec", {
  expect_is(spct2colorSpec(sun.spct), "colorSpec")
  expect_is(as.colorSpec(sun.spct), "colorSpec")
  expect_is(colorSpec2spct(Fs.5nm), "source_spct")
  expect_is(as.generic_spct(Fs.5nm), "source_spct")
  expect_equivalent(spct2colorSpec(sun.spct), as.colorSpec(sun.spct))
  expect_equivalent(colorSpec2spct(Fs.5nm), as.generic_spct(Fs.5nm))
  expect_equivalent(irrad(sun.spct),
                    irrad(colorSpec2spct(spct2colorSpec(sun.spct))))
  expect_equivalent(transmittance(yellow_gel.spct),
                    transmittance(colorSpec2spct(spct2colorSpec(yellow_gel.spct))))
  expect_equal(signif(sum(irrad(colorSpec2mspct(Fs.5nm))[["irrad_Total"]]), 7), 
               38468.75)
  expect_equal(names(colorSpec2mspct(Fs.5nm)),
               specnames(Fs.5nm))
  expect_is(colorSpec2mspct(Fs.5nm), "source_mspct")
  expect_is(colorSpec2spct(Fs.5nm), "source_spct")
  expect_equal(getMultipleWl(colorSpec2spct(Fs.5nm)), numSpectra(Fs.5nm))
  expect_equal(signif(irrad(colorSpec2mspct(C.5nm))[["irrad_Total"]], 7), 
               364.8822)
  expect_equal(names(colorSpec2mspct(C.5nm)),
               specnames(C.5nm))
  expect_is(colorSpec2mspct(C.5nm), "source_mspct")
  expect_is(colorSpec2spct(C.5nm), "source_spct")
  expect_equal(getMultipleWl(colorSpec2spct(C.5nm)), numSpectra(C.5nm))
  expect_is(colorSpec2mspct(Hoya), "filter_mspct")
  expect_is(colorSpec2spct(Hoya), "filter_spct")
  expect_equal(getMultipleWl(colorSpec2spct(Hoya)), numSpectra(Hoya))
  expect_is(colorSpec2mspct(xyz1931.5nm), "response_mspct")
  expect_is(colorSpec2spct(xyz1931.5nm), "response_spct")
  expect_equal(getMultipleWl(colorSpec2spct(xyz1931.5nm)), 
               numSpectra(xyz1931.5nm))
  expect_is(colorSpec2chroma_spct(xyz1931.1nm), "chroma_spct")
  expect_equal(getMultipleWl(colorSpec2chroma_spct(xyz1931.1nm)), 1)
})


