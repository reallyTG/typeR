
library(mnis)
context("reference")
test_that("mnis_reference returns expected format", {

  skip_on_cran()

  refallreferences <- mnis_all_reference()
  expect_length(refallreferences, 39)
  expect_type(refallreferences, "list")
  expect_true(is.list(refallreferences))

  refa <- ref_address_types()
  expect_length(refa, 3)
  expect_type(refa, "list")
  expect_true(tibble::is_tibble(refa))

  refb <- ref_answering_bodies(tidy_style = "camelCase")
  expect_length(refb, 17)
  expect_type(refb, "list")
  expect_true(tibble::is_tibble(refb))

  refc <- ref_areas(tidy_style = "period.case")
  expect_length(refc, 6)
  expect_type(refc, "list")
  expect_true(tibble::is_tibble(refc))

  refd <- ref_area_types()
  expect_length(refd, 2)
  expect_type(refd, "list")
  expect_true(tibble::is_tibble(refd))

  refe <- ref_biography_categories()
  expect_length(refe, 5)
  expect_type(refe, "list")
  expect_true(tibble::is_tibble(refe))

  reff <- ref_cabinets()
  expect_length(reff, 5)
  expect_type(reff, "list")
  expect_true(tibble::is_tibble(reff))

  refg <- ref_committees()
  expect_length(refg, 19)
  expect_type(refg, "list")
  expect_true(tibble::is_tibble(refg))

  refh <- ref_committee_types()
  expect_length(refh, 2)
  expect_type(refh, "list")
  expect_true(tibble::is_tibble(refh))

  refi <- ref_constituencies()
  expect_length(refi, 20)
  expect_type(refi, "list")
  expect_true(tibble::is_tibble(refi))

  refj <- ref_constituency_areas()
  expect_length(refj, 7)
  expect_type(refj, "list")
  expect_true(tibble::is_tibble(refj))

  refk <- ref_constituency_types()
  expect_length(refk, 2)
  expect_type(refk, "list")
  expect_true(tibble::is_tibble(refk))

  refl <- ref_countries()
  expect_length(refl, 3)
  expect_type(refl, "list")
  expect_true(tibble::is_tibble(refl))

  refm <- ref_departments()
  expect_length(refm, 21)
  expect_type(refm, "list")
  expect_true(tibble::is_tibble(refm))

  refn <- ref_disqualification_types()
  expect_length(refn, 3)
  expect_type(refn, "list")
  expect_true(tibble::is_tibble(refn))

  refo <- ref_elections()
  expect_length(refo, 5)
  expect_type(refo, "list")
  expect_true(tibble::is_tibble(refo))

  refp <- ref_election_types()
  expect_length(refp, 2)
  expect_type(refp, "list")
  expect_true(tibble::is_tibble(refp))

  refq <- ref_end_reasons()
  expect_length(refq, 5)
  expect_type(refq, "list")
  expect_true(tibble::is_tibble(refq))

  refr <- ref_experience_types()
  expect_length(refr, 2)
  expect_type(refr, "list")
  expect_true(tibble::is_tibble(refr))

  refs <- ref_government_post_departments()
  expect_length(refs, 5)
  expect_type(refs, "list")
  expect_true(tibble::is_tibble(refs))

  reft <- ref_government_posts()
  expect_length(reft, 11)
  expect_type(reft, "list")
  expect_true(tibble::is_tibble(reft))

  refu <- ref_government_ranks()
  expect_length(refu, 6)
  expect_type(refu, "list")
  expect_true(tibble::is_tibble(refu))

  refv <- ref_honourary_prefixes()
  expect_length(refv, 8)
  expect_type(refv, "list")
  expect_true(tibble::is_tibble(refv))

  refw <- ref_honour_lists()
  expect_length(refw, 2)
  expect_type(refw, "list")
  expect_true(tibble::is_tibble(refw))

  refx <- ref_honours()
  expect_length(refx, 7)
  expect_type(refx, "list")
  expect_true(tibble::is_tibble(refx))

  refy <- ref_interest_categories()
  expect_length(refy, 9)
  expect_type(refy, "list")
  expect_true(tibble::is_tibble(refy))

  refz <- ref_lords_membership_types()
  expect_length(refz, 5)
  expect_type(refz, "list")
  expect_true(tibble::is_tibble(refz))

  refaa <- ref_lords_ranks()
  expect_length(refaa, 3)
  expect_type(refaa, "list")
  expect_true(tibble::is_tibble(refaa))

  refbb <- ref_opposition_post_departments()
  expect_length(refbb, 5)
  expect_type(refbb, "list")
  expect_true(tibble::is_tibble(refbb))

  refcc <- ref_opposition_posts()
  expect_length(refcc, 12)
  expect_type(refcc, "list")
  expect_true(tibble::is_tibble(refcc))

  refdd <- ref_opposition_ranks()
  expect_length(refdd, 6)
  expect_type(refdd, "list")
  expect_true(tibble::is_tibble(refdd))

  refee <- ref_other_parliaments()
  expect_length(refee, 7)
  expect_type(refee, "list")
  expect_true(tibble::is_tibble(refee))

  refff <- ref_parliamentary_posts()
  expect_length(refff, 11)
  expect_type(refff, "list")
  expect_true(tibble::is_tibble(refff))

  refgg <- ref_parliamentary_ranks()
  expect_length(refgg, 3)
  expect_type(refgg, "list")
  expect_true(tibble::is_tibble(refgg))

  refhh <- ref_parliament_types()
  expect_length(refhh, 2)
  expect_type(refhh, "list")
  expect_true(tibble::is_tibble(refhh))

  refii <- ref_parties()
  expect_length(refii,16)
  expect_type(refii, "list")
  expect_true(tibble::is_tibble(refii))

  refjj <- ref_party_sub_types()
  expect_length(refjj, 5)
  expect_type(refjj, "list")
  expect_true(tibble::is_tibble(refjj))

  refkk <- ref_photo_outputs()
  expect_length(refkk, 4)
  expect_type(refkk, "list")
  expect_true(tibble::is_tibble(refkk))

  refll <- ref_statuses()
  expect_length(refll, 8)
  expect_type(refll, "list")
  expect_true(tibble::is_tibble(refll))

  refmm <- ref_titles()
  expect_length(refmm, 2)
  expect_type(refmm, "list")
  expect_true(tibble::is_tibble(refmm))


})
