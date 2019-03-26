library(AnnotationDbi)


### Name: AnnDbObj-objects
### Title: AnnDbObj objects
### Aliases: AnnDbObj-objects AnnDbObj class:AnnDbObj AnnDbObj-class dbconn
###   dbconn,SQLiteConnection-method dbconn,environment-method
###   dbconn,AnnDbObj-method dbfile dbfile,SQLiteConnection-method
###   dbfile,environment-method dbfile,AnnDbObj-method dbmeta
###   dbmeta,DBIConnection-method dbmeta,environment-method
###   dbmeta,AnnDbObj-method dbschema dbschema,DBIConnection-method
###   dbschema,environment-method dbschema,AnnDbObj-method dbInfo
###   dbInfo,DBIConnection-method dbInfo,environment-method
###   dbInfo,AnnDbObj-method
### Keywords: classes methods

### ** Examples

  library("hgu95av2.db")

  dbconn(hgu95av2ENTREZID)              # same as hgu95av2_dbconn()
  dbfile(hgu95av2ENTREZID)              # same as hgu95av2_dbfile()

  dbmeta(hgu95av2_dbconn(), "ORGANISM")
  dbmeta(hgu95av2_dbconn(), "DBSCHEMA")
  dbmeta(hgu95av2_dbconn(), "DBSCHEMAVERSION")

  library("DBI")
  dbListTables(hgu95av2_dbconn())       #lists all tables on connection

  ## If you use dbSendQuery instead of dbGetQuery
  ## (NOTE: for ease of use, this is defintitely NOT reccomended)
  ## Then you may need to know how to list results objects
  dbListResults(hgu95av2_dbconn())      #for listing results objects


  ## You can also list the fields by using this connection
  dbListFields(hgu95av2_dbconn(), "probes")
  dbListFields(hgu95av2_dbconn(), "genes")
  dbschema(hgu95av2ENTREZID)        # same as hgu95av2_dbschema()
  ## According to the schema, the probes._id column references the genes._id
  ## column. Note that in all tables, the "_id" column is an internal id with
  ## no biological meaning (provided for allowing efficient joins between
  ## tables).
  ## The information about the probe to gene mapping is in probes:
  dbGetQuery(hgu95av2_dbconn(), "SELECT * FROM probes LIMIT 10")
  ## This mapping is in fact the ENTREZID map:
  toTable(hgu95av2ENTREZID)[1:10, ] # only relevant columns are retrieved

  dbInfo(hgu95av2GO)                # same as hgu95av2_dbInfo()

  ##Advanced example:
  ##Sometimes you may wish to join data from across multiple databases at
  ##once:
  ## In the following example we will attach the GO database to the
  ## hgu95av2 database, and then grab information from separate tables
  ## in each database that meet a common criteria.
  library(hgu95av2.db)
  library("GO.db")
  attachSql <- paste('ATTACH "', GO_dbfile(), '" as go;', sep = "")
  dbGetQuery(hgu95av2_dbconn(), attachSql)
  sql <- 'SELECT  DISTINCT a.go_id AS "hgu95av2.go_id",
           a._id AS "hgu95av2._id",
           g.go_id AS "GO.go_id", g._id AS "GO._id",
           g.term, g.ontology, g.definition
           FROM go_bp_all AS a, go.go_term AS g
           WHERE a.go_id = g.go_id LIMIT 10;'
  data <- dbGetQuery(hgu95av2_dbconn(), sql)
  data
  ## For illustration purposes, the internal id "_id" and the "go_id"
  ## from both tables is included in the output.  This makes it clear
  ## that the "go_ids" can be used to join these tables but the internal
  ## ids can NOT.  The internal IDs (which are always shown as _id) are
  ## suitable for joins within a single database, but cannot be used
  ## across databases.



